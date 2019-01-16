import struct
import json
import jsonmerge
import re
from intelhex import IntelHex
from tqdm import tqdm
from functools import reduce
import six
from serial.serialutil import SerialTimeoutException
from serial.tools.list_ports import comports
import serial
import platform

use_libusb = False
use_pyserial = False

def pretty_hex(data):
    output = ""
    for i in range(0, len(data), 16):
        output += " ".join(["%02x" % ord(x) for x in data[i:i+16]]) + "\n"
    return output

def to_int(value):
    try:
        return ord(value)
    except:
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

        ports += [
            UsbPort(d)
            for d in usb.core.find(idVendor=vid, idProduct=pid, find_all=True)
            if not d.is_kernel_driver_active(1)
        ]

    # MacOS is not playing nicely with the serial drivers for the bootloader
    if platform.system() != "Darwin" or use_pyserial:
        # get serial ports first
        ports += [SerialPort(p[0]) for p in comports() if device_id in p[2].lower()]

    return ports


class SerialPort(object):
    def __init__(self, port_name):
        self.port_name = port_name
        self.ser = None

    def __str__(self):
        return self.port_name

    def __enter__(self):
        self.ser = serial.Serial(self.port_name, timeout=1.0, writeTimeout=1.0).__enter__()

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.ser.__exit__(exc_type, exc_val, exc_tb)

    def write(self, data):
        self.ser.write(data)

    def flush(self):
        self.ser.flush()

    def read(self, length):
        return self.ser.read(length)


class UsbPort(object):
    def __init__(self, device):
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
        self.OUT.write(data)

    def flush(self):
        # i don't think there's a comparable function on pyusb endpoints
        pass

    def read(self, length):
        if length > 0:
            data = self.IN.read(length)
            return bytearray(data)
        else:
            return ""


bit_reverse_table = bytearray([
    0x00, 0x80, 0x40, 0xC0, 0x20, 0xA0, 0x60, 0xE0, 0x10, 0x90, 0x50, 0xD0, 0x30, 0xB0, 0x70, 0xF0,
    0x08, 0x88, 0x48, 0xC8, 0x28, 0xA8, 0x68, 0xE8, 0x18, 0x98, 0x58, 0xD8, 0x38, 0xB8, 0x78, 0xF8,
    0x04, 0x84, 0x44, 0xC4, 0x24, 0xA4, 0x64, 0xE4, 0x14, 0x94, 0x54, 0xD4, 0x34, 0xB4, 0x74, 0xF4,
    0x0C, 0x8C, 0x4C, 0xCC, 0x2C, 0xAC, 0x6C, 0xEC, 0x1C, 0x9C, 0x5C, 0xDC, 0x3C, 0xBC, 0x7C, 0xFC,
    0x02, 0x82, 0x42, 0xC2, 0x22, 0xA2, 0x62, 0xE2, 0x12, 0x92, 0x52, 0xD2, 0x32, 0xB2, 0x72, 0xF2,
    0x0A, 0x8A, 0x4A, 0xCA, 0x2A, 0xAA, 0x6A, 0xEA, 0x1A, 0x9A, 0x5A, 0xDA, 0x3A, 0xBA, 0x7A, 0xFA,
    0x06, 0x86, 0x46, 0xC6, 0x26, 0xA6, 0x66, 0xE6, 0x16, 0x96, 0x56, 0xD6, 0x36, 0xB6, 0x76, 0xF6,
    0x0E, 0x8E, 0x4E, 0xCE, 0x2E, 0xAE, 0x6E, 0xEE, 0x1E, 0x9E, 0x5E, 0xDE, 0x3E, 0xBE, 0x7E, 0xFE,
    0x01, 0x81, 0x41, 0xC1, 0x21, 0xA1, 0x61, 0xE1, 0x11, 0x91, 0x51, 0xD1, 0x31, 0xB1, 0x71, 0xF1,
    0x09, 0x89, 0x49, 0xC9, 0x29, 0xA9, 0x69, 0xE9, 0x19, 0x99, 0x59, 0xD9, 0x39, 0xB9, 0x79, 0xF9,
    0x05, 0x85, 0x45, 0xC5, 0x25, 0xA5, 0x65, 0xE5, 0x15, 0x95, 0x55, 0xD5, 0x35, 0xB5, 0x75, 0xF5,
    0x0D, 0x8D, 0x4D, 0xCD, 0x2D, 0xAD, 0x6D, 0xED, 0x1D, 0x9D, 0x5D, 0xDD, 0x3D, 0xBD, 0x7D, 0xFD,
    0x03, 0x83, 0x43, 0xC3, 0x23, 0xA3, 0x63, 0xE3, 0x13, 0x93, 0x53, 0xD3, 0x33, 0xB3, 0x73, 0xF3,
    0x0B, 0x8B, 0x4B, 0xCB, 0x2B, 0xAB, 0x6B, 0xEB, 0x1B, 0x9B, 0x5B, 0xDB, 0x3B, 0xBB, 0x7B, 0xFB,
    0x07, 0x87, 0x47, 0xC7, 0x27, 0xA7, 0x67, 0xE7, 0x17, 0x97, 0x57, 0xD7, 0x37, 0xB7, 0x77, 0xF7,
    0x0F, 0x8F, 0x4F, 0xCF, 0x2F, 0xAF, 0x6F, 0xEF, 0x1F, 0x9F, 0x5F, 0xDF, 0x3F, 0xBF, 0x7F, 0xFF
])


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
            return json.loads(bytes(data).decode("utf-8"))
        except:
            return None

    def _resolve_pointers(self, meta):
        if isinstance(meta, dict):
            return {k: self._resolve_pointers(v) for k, v in meta.items()}

        if isinstance(meta, list):
            return [self._resolve_pointers(v) for v in meta]

        if isinstance(meta, (str, bytes)):
            m = re.search(r"^\s*@\s*0x(?P<addr>[A-Fa-f0-9]+)\s*\+\s*(?P<len>\d+)\s*$", meta)
            if m:
                data = self.prog.read(int(m.group("addr"), 16), int(m.group("len")))
                return json.loads(bytes(data).decode("utf-8"))
            else:
                return meta

        return meta

    def _read_metadata(self):
        import math
        meta_roots = (
            [self._parse_json(self.prog.read_security_register_page(p).replace(b"\x00", b"").replace(b"\xff", b"")) for p in [1, 2, 3]] +
            [self._parse_json(self.prog.read(int(math.pow(2, p) - (4 * 1024)), (4 * 1024)).replace(b"\x00", b"").replace(b"\xff", b"")) for p in [17, 18, 19, 20, 21, 22, 23, 24]]
        )
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
        addr_str = self.root[u"bootmeta"][u"addrmap"][name]
        m = re.search(r"^\s*0x(?P<start>[A-Fa-f0-9]+)\s*-\s*0x(?P<end>[A-Fa-f0-9]+)\s*$", addr_str)
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
        #print("type of data is %s" % type(data))
        #assert isinstance(data, bytes)
        addr = b'' if addr is None else struct.pack('>I', addr)[1:]
        write_string = bytearray([opcode]) + addr + data
        cmd_write_string = b'\x01' + struct.pack('<HH', len(write_string), read_len) + write_string
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
        self.cmd(self.security_page_erase_cmd, page << (8 + self.security_page_bit_offset))
        self.wait_while_busy()

    def program_security_register_page(self, page, data):
        self.write_enable()
        self.cmd(self.security_page_write_cmd, page << (8 + self.security_page_bit_offset), data)
        self.wait_while_busy()

    def read_security_register_page(self, page):
        return self.cmd(self.security_page_read_cmd, addr=page << (8 + self.security_page_bit_offset), data=b'\x00', read_len=255)

    def read(self, addr, length, disable_progress=True, max_length = 255):
        data = b''
        with tqdm(desc="    Reading", unit="B", unit_scale=True, total=length, disable=disable_progress) as pbar:
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

        with tqdm(desc="    Erasing", unit="B", unit_scale=True, total=length, disable=disable_progress) as pbar:
            while length > 0:
                erase_length = max(p for p in possible_lengths
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

    def write(self, addr, data, disable_progress=True, max_length = 256):
        offset = 0
        with tqdm(desc="    Writing", unit="B", unit_scale=True, total=len(data), disable=disable_progress) as pbar:
            while offset < len(data):
                dist_to_256_byte_boundary = 256 - (addr & 0xff)
                write_length = min(max_length, len(data) - offset, dist_to_256_byte_boundary)
                write_data = data[offset : offset+write_length]
            
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

        with tqdm(desc="    Programming and Verifying", unit="B", unit_scale=True, total=len(data)) as pbar:
            for offset in range(0, len(data), sector_size):
                current_addr = addr + offset
                current_write_data = data[offset:offset + sector_size]
                self.erase(current_addr, sector_size, disable_progress=True)

                minor_sector_size = 256
                for minor_offset in range(0, 4 * 1024, minor_sector_size):
                    minor_write_data = current_write_data[minor_offset:minor_offset+minor_sector_size]
                    self.write(current_addr + minor_offset, minor_write_data, disable_progress=True, max_length=256)
                    minor_read_data = self.read(current_addr + minor_offset, len(minor_write_data), disable_progress=True, max_length=255)
                    
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
        except:
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
                return bytes("".join(chr(int(i, 16)) for i in f.read().split()))

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
