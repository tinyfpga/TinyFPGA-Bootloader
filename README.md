# USB Bootloader
The USB Bootloader implements a USB virtual serial port to SPI flash bridge.  From the host computer's perspective, it looks like a serial port.  This method was chosen because programming with serial ports is generally easier to understand than other USB-specific protocols.  Commands boot into the user configuration or access the SPI flash are all transfered over this interface.  

## Protocol
The protocol on top of the USB virtual serial port takes the form of requests and responses.  Only the host computer is able to initiate requests.  The bootloader on the FPGA can only respond to requests.

### Boot Command
```
Length: 1 byte

+=====================+
|    Request Data     |
+=====+========+======+
| Byte| Field  |Value |
+=====+========+======+
|  0  | Opcode | 0x00 |
+-----+--------+------+
```

The `Boot` command forces the TinyFPGA B-series board to exit the bootloader and configure the FPGA with the user design from SPI flash.  Once the user design is loaded onto the FPGA, the bootloader is no longer present and the user design has full control over the FPGA, including the USB interface.   

### Access SPI Command
```
Length: Variable

+================================+
|          Request Data          |
+=====+===================+======+
| Byte|       Field       | Value|
+=====+===================+======+
|  0  |       Opcode      | 0x01 |
+-----+-------------------+------+
|  1  |  Write Length Lo  | 0xWW |
+-----+-------------------+------+
|  2  |  Write Length Hi  | 0xWW |
+-----+-------------------+------+
|  3  |   Read Length Lo  | 0xRR |
+-----+-------------------+------+
|  4  |   Read Length Hi  | 0xRR |
+-----+-------------------+------+
|  5  | Write Data Byte 0 | 0xDD |
+-----+-------------------+------+
+-----+-------------------+------+
| n+5 | Write Data Byte n | 0xDD |
+-----+-------------------+------+

+================================+
|         Response Data          |
+=====+===================+======+
| Byte|       Field       | Value|
+=====+===================+======+
|  0  |  Read Data Byte 0 | 0xDD |
+-----+-------------------+------+
+-----+-------------------+------+
|  n  |  Read Data Byte n | 0xDD |
+-----+-------------------+------+
```

**NOTE: Even though the read and write fields are two bytes long, the current bootloader only supports read and write lengths of up to 16 bytes.  It will crash if larger lengths are used.**

The `Access SPI` command executes a transfer with the SPI flash.  SPI flash commands can have two phases:
1. Write phase.  Command opcode, address, and potentially data are shifted out the SPI master to the SPI flash.
2. Read phase.  Data is shifted from the SPI flash to the SPI master.

The `Write Length` and `Read Length` in the `Access SPI` command refer to these two phases.  In order to fully understand how to interact with the SPI flash you need to read the [datasheet for the SPI flash chip](http://datasheet.octopart.com/AT25SF041-SSHD-B-Adesto-Technologies-datasheet-62342976.pdf).  The datasheet contains a table that lists the commands the SPI flash chip supports.  

Here's a summary of the commands used to properly erase, program, and verify bitstreams on the SPI flash:

| Command               | Opcode      | Address Bytes | Dummy Bytes | Data Bytes | Datasheet Section |
|-----------------------|:-----------:|:-------------:|:-----------:|:----------:|:-----------------:|
| Resume                |     0xAB    |       0       |      0      |      0     |        11.4       |
| Read Man. and Dev. ID |     0x9F    |       0       |      0      |      0     |        11.1       |
| Read Status Reg 1     |     0x05    |       0       |      0      |      1     |        10.1       |
| Block Erase 4 KBytes  |     0x20    |       3       |      0      |      0     |         7.2       |
| Block Erase 32 KBytes |     0x52    |       3       |      0      |      0     |         7.2       |
| Block Erase 64 KBytes |     0xD8    |       3       |      0      |      0     |         7.2       |
| Write Enable          |     0x06    |       0       |      0      |      0     |         8.1       |
| Byte/Page Program     |     0x02    |       3       |      0      |     1+     |         7.1       |
| Read Array            |     0x0B    |       3       |      1      |     1+     |         6.1       |     

## SPI Flash Programming Flow

The SPI flash needs to be accessed in a specific order to successfully program the bitstream.  The following pseudocode illustrates how the `tinyfpgab.py` programmer accesses the SPI flash:

```
// SPI flash will be in deep sleep, we need to wake it up
Issue Resume command     

// these two commands work around a bootloader bug
Read Status Register        
Read 16 bytes from addr 0  

// erase user flash area
For each 4k block from (0x30000) to (0x30000 + length(bitstream)):
    Issue Block Erase 4 KBytes at current block address
    Poll Read Status Reg 1 until bit 0 is cleared

// program new user bitstream into user flash area
For each 16 bytes from (0x30000) to (0x30000 + length(bitstream)):
    Issue write enable command
    Write 16 bytes of of the bitstream and increment write offset by 16 bytes
    
// verify bitstream data is correct
For each 16 bytes from (0x30000) to (0x30000 + length(bitstream)):
    Read 16 bytes of of the bitstream, compare to bitstream file, and increment read offset by 16 bytes

Issue Boot command to the bootloader
```

For exact details, see the [tinyfpgab.py](https://github.com/tinyfpga/TinyFPGA-B-Series/blob/master/programmer/tinyfpgab.py) programming script in this repo.

