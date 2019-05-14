import json
import platform
import re
import struct

from functools import reduce
from pkg_resources import get_distribution, DistributionNotFound

import jsonmerge
import serial
from intelhex import IntelHex
from serial.tools.list_ports import comports
from tqdm import tqdm

from .data_tables import bit_reverse_table

try:
    __version__ = get_distribution(__name__).version
except DistributionNotFound:
    # package is not installed
    __version__ = "unknown"

try:
    from .full_version import __full_version__
    if not __full_version__:
        raise ValueError
except (ImportError, ValueError):
    __full_version__ = "unknown"


use_libusb = False
use_pyserial = False


def pretty_hex(data):
    """
    >>> print(pretty_hex("abc123"))
    61 62 63 31 32 33
    >>> print(pretty_hex(b"abc123"))
    61 62 63 31 32 33
    >>> print(pretty_hex(u"abc123"))
    61 62 63 31 32 33
    >>> print(pretty_hex("\\x00a\\x02"*12))
    00 61 02 00 61 02 00 61 02 00 61 02 00 61 02 00
    61 02 00 61 02 00 61 02 00 61 02 00 61 02 00 61
    02 00 61 02
    """
    output = []
    for i in range(0, len(data), 16):
        output.append(" ".join("%02x" % to_int(x) for x in data[i:i + 16]))
    return "\n".join(output)


def to_int(value):
    """
    >>> to_int('A')
    65
    >>> to_int(0xff)
    255
    >>> list(to_int(i) for i in ['T', 'i', 'n', 'y', 0xff, 0, 0])
    [84, 105, 110, 121, 255, 0, 0]
    """
    try:
        return ord(value)
    except (ValueError, TypeError):
        return int(value)


def get_ports(device_id):
    """
    Return ports for all devices with the given device_id.

    :param device_id: USB VID and PID.
    :return: List of port objects.
    """

    ports = []

    if platform.system() == "Darwin" or use_libusb:
        import usb
        vid, pid = [int(x, 16) for x in device_id.split(":")]

        try:
            ports += [
                UsbPort(usb, d)
                for d in usb.core.find(
                    idVendor=vid, idProduct=pid, find_all=True)
                if not d.is_kernel_driver_active(1)
            ]
        except usb.core.USBError as e:
            raise PortError("Failed to open USB:\n%s" % str(e))

    # MacOS is not playing nicely with the serial drivers for the bootloader
    if platform.system() != "Darwin" or use_pyserial:
        # get serial ports first
        ports += [
            SerialPort(p[0]) for p in comports() if device_id in p[2].lower()
        ]

    return ports


class PortError(Exception):
    pass


class SerialPort(object):
    def __init__(self, port_name):
        self.port_name = port_name
        self.ser = None

    def __str__(self):
        return self.port_name

    def __enter__(self):
        try:
            self.ser = serial.Serial(
                self.port_name, timeout=1.0, writeTimeout=1.0).__enter__()
        except serial.SerialException as e:
            raise PortError("Failed to open serial port:\n%s" % str(e))

    def __exit__(self, exc_type, exc_val, exc_tb):
        try:
            self.ser.__exit__(exc_type, exc_val, exc_tb)
        except serial.SerialException as e:
            raise PortError("Failed to close serial port:\n%s" % str(e))

    def write(self, data):
        try:
            self.ser.write(data)
        except serial.SerialException as e:
            raise PortError("Failed to write to serial port:\n%s" % str(e))

    def flush(self):
        try:
            self.ser.flush()
        except serial.SerialException as e:
            raise PortError("Failed to flush serial port:\n%s" % str(e))

    def read(self, length):
        try:
            return self.ser.read(length)
        except serial.SerialException as e:
            raise PortError("Failed to read from serial port:\n%s" % str(e))


class UsbPort(object):
    def __init__(self, usb, device):
        self.usb = usb
        self.device = device
        usb_interface = device.configurations()[0].interfaces()[1]
        self.OUT = usb_interface.endpoints()[0]
        self.IN = usb_interface.endpoints()[1]

    def __str__(self):
        return "USB %d.%d" % (self.device.bus, self.device.port_number)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        pass

    def write(self, data):
        try:
            self.OUT.write(data)
        except self.usb.core.USBError as e:
            raise PortError("Failed to write to USB:\n%s" % str(e))

    def flush(self):
        # i don't think there's a comparable function on pyusb endpoints
        pass

    def read(self, length):
        try:
            if length > 0:
                data = self.IN.read(length)
                return bytearray(data)
            else:
                return ""
        except self.usb.core.USBError as e:
            raise PortError("Failed to read from USB:\n%s" % str(e))


def _mirror_byte(b):
    return bit_reverse_table[to_int(b)]


def _mirror_each_byte(data):
    mirrored_data = bytearray(len(data))
    for i in range(0, len(data)):
        mirrored_data[i] = _mirror_byte(data[i])
    return mirrored_data


class TinyMeta(object):
    def __init__(self, prog):
        self.prog = prog
        prog.wake()
        self.root = self._read_metadata()

    def _parse_json(self, data):
        try:
            data = bytes(data)
            data = data.replace(b"\x00", b"")
            data = data.replace(b"\xff", b"")
            data = data.decode("utf-8")
            return json.loads(data)
        except BaseException:
            return None

    def _resolve_pointers(self, meta):
        if isinstance(meta, dict):
            return {k: self._resolve_pointers(v) for k, v in meta.items()}

        if isinstance(meta, list):
            return [self._resolve_pointers(v) for v in meta]

        if isinstance(meta, (str, bytes)):
            m = re.search(
                r"^\s*@\s*0x(?P<addr>[A-Fa-f0-9]+)\s*\+\s*(?P<len>\d+)\s*$",
                meta)
            if m:
                data = self.prog.read(
                    int(m.group("addr"), 16), int(m.group("len")))
                return self._parse_json(data)
            else:
                return meta

        return meta

    def _read_metadata(self):
        import math
        meta_roots = (
            [
                self._parse_json(
                    self.prog.read_security_register_page(p))
                for p in [1, 2, 3]
            ] + [
                self._parse_json(
                    self.prog.read(
                        int(math.pow(2, p) - (4 * 1024)), (4 * 1024)))
                for p in [17, 18, 19, 20, 21, 22, 23, 24]
            ])
        meta_roots = [root for root in meta_roots if root is not None]
        if len(meta_roots) > 0:
            meta = reduce(jsonmerge.merge, meta_roots)
            return self._resolve_pointers(meta)
        return None

    def bootloader_addr_range(self):
        return self._get_addr_range(u"bootloader")

    def userimage_addr_range(self):
        return self._get_addr_range(u"userimage")

    def userdata_addr_range(self):
        return self._get_addr_range(u"userdata")

    def _get_addr_range(self, name):
        # get the bootmeta's addrmap or fallback to the root's addrmap.
        addr_map = self.root.get(u"bootmeta", {}).get(
            u"addrmap", self.root.get(u"addrmap", None))
        if addr_map is None:
            raise Exception("Missing address map from device metadata")
        addr_str = addr_map.get(name, None)
        if addr_str is None:
            raise Exception("Missing address map for '{0}'.".format(name))

        m = re.search(
            r"^\s*0x(?P<start>[A-Fa-f0-9]+)\s*-\s*0x(?P<end>[A-Fa-f0-9]+)\s*$",
            addr_str)
        if m:
            return int(m.group("start"), 16), int(m.group("end"), 16)
        else:
            return None

    def uuid(self):
        return str(self.root[u"boardmeta"][u"uuid"])


class TinyProg(object):
    def __init__(self, ser, progress=None):
        self.ser = ser

        if progress is None:
            self.progress = lambda x: x
        else:
            self.progress = progress

        self.wake()
        flash_id = self.read_id()
        flash_id = [to_int(b) for b in flash_id]
        # temporary hack, should have better database as well as SFPD reading
        if flash_id[0:2] == [0x9D, 0x60]:
            # ISSI
            self.security_page_bit_offset = 4
            self.security_page_write_cmd = 0x62
            self.security_page_read_cmd = 0x68
            self.security_page_erase_cmd = 0x64

        else:
            # Adesto
            self.security_page_bit_offset = 0
            self.security_page_write_cmd = 0x42
            self.security_page_read_cmd = 0x48
            self.security_page_erase_cmd = 0x44

        self.meta = TinyMeta(self)

    def is_bootloader_active(self):
        self.wake()
        devid = self.read_id()
        if devid not in [b'\xff\xff\xff']:
            return True
        return False

    def cmd(self, opcode, addr=None, data=b'', read_len=0):
        addr = b'' if addr is None else struct.pack('>I', addr)[1:]
        write_string = bytearray([opcode]) + addr + data
        cmd_write_string = b'\x01' + struct.pack(
            '<HH', len(write_string), read_len) + write_string
        self.ser.write(bytearray(cmd_write_string))
        self.ser.flush()
        return self.ser.read(read_len)

    def sleep(self):
        self.cmd(0xb9)

    def wake(self):
        self.cmd(0xab)

    def read_id(self):
        return self.cmd(0x9f, read_len=3)

    def read_sts(self):
        return self.cmd(0x05, read_len=1)

    def erase_security_register_page(self, page):
        self.write_enable()
        self.cmd(
            self.security_page_erase_cmd,
            page << (8 + self.security_page_bit_offset))
        self.wait_while_busy()

    def program_security_register_page(self, page, data):
        self.write_enable()
        self.cmd(
            self.security_page_write_cmd,
            page << (8 + self.security_page_bit_offset), data)
        self.wait_while_busy()

    def read_security_register_page(self, page):
        return self.cmd(
            self.security_page_read_cmd,
            addr=page << (8 + self.security_page_bit_offset),
            data=b'\x00',
            read_len=255)

    def read(self, addr, length, disable_progress=True, max_length=255):
        data = b''
        with tqdm(desc="    Reading", unit="B", unit_scale=True, total=length,
                  disable=disable_progress) as pbar:
            while length > 0:
                read_length = min(max_length, length)
                data += self.cmd(0x0b, addr, b'\x00', read_len=read_length)
                self.progress(read_length)
                addr += read_length
                length -= read_length
                pbar.update(read_length)
            return data

    def write_enable(self):
        self.cmd(0x06)

    def write_disable(self):
        self.cmd(0x04)

    def wait_while_busy(self):
        while to_int(self.read_sts()) & 1:
            pass

    def _erase(self, addr, length):
        opcode = {
            4 * 1024: 0x20,
            32 * 1024: 0x52,
            64 * 1024: 0xd8,
        }[length]
        self.write_enable()
        self.cmd(opcode, addr)
        self.wait_while_busy()

    def erase(self, addr, length, disable_progress=True):
        possible_lengths = (1, 4 * 1024, 32 * 1024, 64 * 1024)

        with tqdm(desc="    Erasing", unit="B", unit_scale=True, total=length,
                  disable=disable_progress) as pbar:
            while length > 0:
                erase_length = max(
                    p for p in possible_lengths
                    if p <= length and addr % p == 0)

                if erase_length == 1:
                    # there are no opcode to erase that much
                    # either we want to erase up to multiple of 0x1000
                    # or we want to erase up to length

                    # start_addr                            end_addr
                    # v                                     v
                    # +------------------+------------------+----------------+
                    # |       keep       |      erase       |      keep      |
                    # +------------------+------------------+----------------+
                    #  <- start_length -> <- erase_length -> <- end_length ->

                    start_addr = addr & 0xfff000
                    start_length = addr & 0xfff
                    erase_length = min(0x1000 - start_length, length)
                    end_addr = start_addr + start_length + erase_length
                    end_length = start_addr + 0x1000 - end_addr

                    # read data we need to restore later
                    if start_length:
                        start_read_data = self.read(start_addr, start_length)
                    if end_length:
                        end_read_data = self.read(end_addr, end_length)

                    # erase the block
                    self._erase(start_addr, 0x1000)

                    # restore data
                    if start_length:
                        self.write(start_addr, start_read_data)
                    if end_length:
                        self.write(end_addr, end_read_data)

                else:
                    # there is an opcode to erase that much data
                    self.progress(erase_length)
                    self._erase(addr, erase_length)

                # update
                length -= erase_length
                addr += erase_length
                pbar.update(erase_length)

    # don't use this directly, use the public "write" function instead
    def _write(self, addr, data):
        self.write_enable()
        self.cmd(0x02, addr, data)
        self.wait_while_busy()
        self.progress(len(data))

    def write(self, addr, data, disable_progress=True, max_length=256):
        offset = 0
        with tqdm(desc="    Writing", unit="B", unit_scale=True,
                  total=len(data), disable=disable_progress) as pbar:
            while offset < len(data):
                dist_to_256_byte_boundary = 256 - (addr & 0xff)
                write_length = min(
                    max_length,
                    len(data) - offset, dist_to_256_byte_boundary)
                write_data = data[offset:offset + write_length]

                self._write(addr, write_data)
                offset += write_length
                addr += write_length
                pbar.update(write_length)

    def program_fast(self, addr, data):
        self.erase(addr, len(data), disable_progress=False)
        self.write(addr, data, disable_progress=False)
        read_back = self.read(addr, len(data), disable_progress=False)

        if read_back == data:
            self.progress("Success!")
            return True
        else:
            read_back_file = open("readback.bin", "wb")
            read_back_file.write(read_back)
            read_back_file.close()
            self.progress("FAILED!")
            return False

    def program_sectors(self, addr, data):
        sector_size = 4 * 1024

        with tqdm(desc="    Programming and Verifying", unit="B",
                  unit_scale=True, total=len(data)) as pbar:
            for offset in range(0, len(data), sector_size):
                current_addr = addr + offset
                current_write_data = data[offset:offset + sector_size]
                self.erase(current_addr, sector_size, disable_progress=True)

                minor_sector_size = 256
                for minor_offset in range(0, 4 * 1024, minor_sector_size):
                    minor_write_data = current_write_data[
                        minor_offset:minor_offset + minor_sector_size]
                    self.write(
                        current_addr + minor_offset,
                        minor_write_data,
                        disable_progress=True,
                        max_length=256)
                    minor_read_data = self.read(
                        current_addr + minor_offset,
                        len(minor_write_data),
                        disable_progress=True,
                        max_length=255)

                    pbar.update(len(minor_write_data))

                    if minor_read_data != minor_write_data:
                        print("")
                        print("Offset: %d" % (current_addr + minor_offset))
                        print("Readback Data:")
                        print(pretty_hex(minor_read_data))
                        print("Write Data:")
                        print(pretty_hex(minor_write_data))
                        self.progress("FAILED!")
                        return False

        self.progress("Success!")
        return True

    def boot(self):
        try:
            self.ser.write(b"\x00")
            self.ser.flush()
        except BaseException:
            # we might get a writeTimeoutError and that's OK.  Sometimes the
            # bootloader will reboot before it finishes sending out the USB ACK
            # for the boot command data packet.
            pass

    def slurp(self, filename):
        if filename.endswith('.bit') or filename.endswith('.bin'):
            with open(filename, 'rb') as f:
                return f.read()

        elif filename.endswith('.hex'):
            with open(filename, 'rb') as f:
                return bytes(
                    "".join(chr(int(i, 16)) for i in f.read().split()))

        elif filename.endswith('.mcs'):
            ih = IntelHex()
            ih.fromfile(filename, format='hex')
            bitstream = ih.tobinstr(start=0, end=ih.maxaddr())
            bitstream = _mirror_each_byte(bitstream)
            return bitstream

        else:
            raise ValueError('Unknown bitstream extension')

    def program_bitstream(self, addr, bitstream):
        self.progress("Waking up SPI flash")
        self.wake()
        self.progress(str(len(bitstream)) + " bytes to program")
        return self.program_sectors(addr, bitstream)

    def program_bitstream_fast(self, addr, bitstream):
        self.progress("Waking up SPI flash")
        self.wake()
        self.progress(str(len(bitstream)) + " bytes to program")
        return self.program_fast(addr, bitstream)
