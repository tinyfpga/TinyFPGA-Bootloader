# TinyFPGA CLI Programmer

## GUI

The GUI has been moved to the [TinyFPGA Programmer Application repo][gui-repo].
However, the `tinyprog` tool can be used on its own with a command-line
interface:

[gui-repo]: https://github.com/tinyfpga/TinyFPGA-Programmer-Application


## CLI

```
> tinyprog --help
usage: tinyprog [-h] [-l] [-p PROGRAM] [-u PROGRAM_USERDATA] [-b] [-c COM]
                [-i ID] [-d DEVICE] [-a ADDR] [-m]

optional arguments:
  -h, --help            show this help message and exit
  -l, --list            list connected and active FPGA boards
  -p PROGRAM, --program PROGRAM
                        program FPGA board with the given bitstream
  -u PROGRAM_USERDATA, --program-userdata PROGRAM_USERDATA
                        program FPGA board with the given user data
  -b, --boot            command the FPGA board to exit the bootloader and load
                        the user configuration
  -c COM, --com COM     serial port name
  -i ID, --id ID        FPGA board ID
  -d DEVICE, --device DEVICE
                        device id (vendor:product); default is (1d50:6130)
  -a ADDR, --addr ADDR  force the address to write the bitstream to
  -m, --meta            dump out the metadata for all connected boards in JSON
```

You can list valid ports with the `--list` option:

```
> tinyprog -l

    TinyProg CLI
    ------------
    Using device id 1d50:6130
    Only one board with active bootloader, using it.
    Boards with active bootloaders:

        COM14: TinyFPGA BX 1.0.0
            UUID: e518a627-5626-4f92-91f5-07ed26503bb9
            FPGA: ice40lp8k-cm81

```

You can use the `--com` option to specify a specific port.  If you don't specify a port, it will use the first one in the list:

```
tinyprog --com COM14 --program "..\boards\TinyFPGA_BX\fw.bin"

    TinyProg CLI
    ------------
    Using device id 1d50:6130
    Only one board with active bootloader, using it.
    Programming COM14 with ..\boards\TinyFPGA_BX\fw.bin
    Programming at addr 028000
    Waking up SPI flash
    298940 bytes to program
    Erasing: 100%|¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦| 299k/299k [00:01<00:00, 223kB/s]
    Writing: 100%|¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦| 299k/299k [00:01<00:00, 235kB/s]
    Reading: 100%|¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦| 299k/299k [00:00<00:00, 490kB/s]
    Success!
```

You can use the `--id` option to specify a device by ID.  You can use just the first few characters of the ID:

```
tinyprog --id e5 --program "..\boards\TinyFPGA_BX\fw.bin"

    TinyProg CLI
    ------------
    Using device id 1d50:6130
    Only one board with active bootloader, using it.
    Programming COM14 with ..\boards\TinyFPGA_BX\fw.bin
    Programming at addr 028000
    Waking up SPI flash
    298940 bytes to program
    Erasing: 100%|¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦| 299k/299k [00:01<00:00, 223kB/s]
    Writing: 100%|¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦| 299k/299k [00:01<00:00, 235kB/s]
    Reading: 100%|¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦| 299k/299k [00:00<00:00, 490kB/s]
    Success!
```


## Testing

Tests have been removed for now pending refactoring of test methodology.
