#!/usr/bin/env python

import struct
import sys

golden_image_address = 0x140000
# jump_command_address = 0x3FFF00 = 4194048
reverse_bytes = 0
reverse_bits = 0

def reverse_Bits(n, no_of_bits):
    result = 0
    for i in range(no_of_bits):
        result <<= 1
        result |= n & 1
        n >>= 1
    return result

def uint8(n):
  if reverse_bits:
    n = reverse_Bits(n, 8)
  return struct.pack(">B", n)

def uint16(n):
  if reverse_bits:
    n = reverse_Bits(n, 16)
  if reverse_bytes:
    return struct.pack("<H", n)    
  else:
    return struct.pack(">H", n)

def uint24(n):
  if reverse_bits:
    n = reverse_Bits(n, 24)
  if reverse_bytes:
    return struct.pack("<BH", n & 0xFF, n >> 8 )
  else:
    return struct.pack(">HB", n >> 8, n & 0xFF )

def uint32(n):
  if reverse_bits:
    n = reverse_Bits(n, 32)
  if reverse_bytes:
    return struct.pack(">L", n)    
  else:
    return struct.pack(">L", n)

packet = b''
# Frame (START) 16 dummy bytes
packet += uint32(0xFFFFFFFF) # 4 dummy bytes
packet += uint32(0xFFFFFFFF) # 4 dummy bytes
packet += uint32(0xFFFFFFFF) # 4 dummy bytes
packet += uint32(0xFFFFFFFF) # 4 dummy bytes
# Preamble
packet += uint16(0xBDB3) # Preamble
# Frame (Control Register 0)
packet += uint8(0xC4) # Write control register 0 command
packet += uint24(0) # 24-bit Command Information
packet += uint32(0) # Control Register 0 data
# Framme (Jump Command)
packet += uint8(0xFE) # Jump command
packet += uint24(0) # 24-bit Command Information
packet += uint8(0x03) # SPI Flash Read opcode (0x03 = regular read, 0x0B = fast read)
packet += uint24(golden_image_address) # 24-bit SPI Flash Sector X address
# Frame (END) 16 dummy bytes
packet += uint32(0xFFFFFFFF) # 4 dummy bytes
packet += uint32(0xFFFFFFFF) # 4 dummy bytes
packet += uint32(0xFFFFFFFF) # 4 dummy bytes
packet += uint32(0xFFFFFFFF) # 4 dummy bytes

sys.stdout.write(packet)
# print([elem.encode("hex") for elem in packet])
