import struct
import time
import json
import jsonmerge
import re
import intelhex 

class TinyMeta(object):
    def __init__(self, prog):
        self.prog = prog
        self.root = self._read_metadata()

    def _parse_json(self, data):
        try:
            return json.loads(data)
        except:
            return None

    def _resolve_pointers(self, meta):
        if isinstance(meta, dict):
            return {k: self._resolve_pointers(v) for k, v in meta.items()}

        if isinstance(meta, list):
            return [self._resolve_pointers(v) for v in meta]

        if isinstance(meta, str):
            m = re.search(r"^\s*@\s*0x(?P<addr>[A-Fa-f0-9]+)\s*\+\s*(?P<len>\d+)\s*$")
            if m:
                return json.loads(self.prog.read(int(m.groups("addr"), 16), int(m.groups("len"))))
            else:
                return meta

        return meta

    def _read_metadata(self):
        meta_roots = [self._parse_json(self.prog.read_security_register_page(p)) for p in [1, 2, 3]]
        meta_roots = [root for root in meta_roots if root is not None]
        meta = reduce(jsonmerge.merge, meta_roots)

        return self._resolve_pointers(meta)




class TinyProg(object):
    def __init__(self, ser, progress=None):
        self.ser = ser
        if progress is None:
            self.progress = lambda x: x
        else:
            self.progress = progress

    def is_bootloader_active(self):
        self.wake()
        devid = self.read_id()
        print "flash id: " + str([hex(ord(x)) for x in devid])
        if devid not in ['\xff\xff\xff']:
            return True
        return False

    def cmd(self, opcode, addr=None, data='', cmd_read_len=0):
        assert isinstance(data, str)
        addr = '' if addr is None else struct.pack('>I', addr)[1:]
        write_string = chr(opcode) + addr + data
        cmd_write_string = '\x01{}{}'.format(
            struct.pack('<HH', len(write_string), cmd_read_len),
            write_string,
        )
        self.ser.write(cmd_write_string)
        self.ser.flush()
        return self.ser.read(cmd_read_len)

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
        self.cmd(0x44, page << 8)
        self.wait_while_busy()

    def program_security_register_page(self, page, data):
        self.write_enable()
        self.cmd(0x42, page << 8, data)
        self.wait_while_busy()

    def read_security_register_page(self, page):
        return self.cmd(0x48, page << 8, '\x00', read_len=256)

    def read(self, addr, length):
        data = ''
        while length > 0:
            read_length = min(1024, length)
            data += self.cmd(0x0b, addr, '\x00', read_len=read_length)
            self.progress(read_length)
            addr += read_length
            length -= read_length
        return data

    def write_enable(self):
        self.cmd(0x06)

    def write_disable(self):
        self.cmd(0x04)

    def wait_while_busy(self):
        while ord(self.read_sts()) & 1:
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

    def erase(self, addr, length):
        possible_lengths = (1, 4 * 1024, 32 * 1024, 64 * 1024)

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

    # don't use this directly, use the public "write" function instead
    def _write(self, addr, data):
        self.write_enable()
        self.cmd(0x02, addr, data)
        self.wait_while_busy()
        self.progress(len(data))

    def write(self, addr, data):
        offset = 0
        while offset < len(data):
            dist_to_256_byte_boundary = 256 - (addr & 0xff)
            write_length = min(256, len(data) - offset, dist_to_256_byte_boundary)
            write_data = data[offset : offset+write_length]
            
            self._write(addr, write_data)
            offset += write_length
            addr += write_length

    def program(self, addr, data):
        self.progress("Erasing designated flash pages")
        self.erase(addr, len(data))

        self.progress("Writing bitstream")
        self.write(addr, data)

        self.progress("Verifying bitstream")
        read_back = self.read(addr, len(data))

        if read_back == data:
            self.progress("Success!")
            return True
        else:
            self.progress("Failure!")
            return False

    def boot(self):
        self.ser.write("\x00")
        self.ser.flush()

    def slurp(self, filename):
        with open(filename, 'rb') as f:
            bitstream = f.read()
        if filename.endswith('.hex'):
            bitstream = ''.join(chr(int(i, 16)) for i in bitstream.split())
        elif not filename.endswith('.bin') and not filename.endswith('.bit'):
            raise ValueError('Unknown bitstream extension')
        return (0x30000, bitstream)

    def program_bitstream(self, addr, bitstream):
        self.progress("Waking up SPI flash")
        self.progress(str(len(bitstream)) + " bytes to program")
        if self.program(addr, bitstream):
            self.boot()
            return True

        return False
