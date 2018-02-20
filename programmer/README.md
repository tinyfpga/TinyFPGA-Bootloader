# Programmer

## GUI

The GUI has been moved to the [TinyFPGA Programmer Application repo][gui-repo].
However, the `tinyprog` tool can be used on its own with a command-line
interface:

[gui-repo]: https://github.com/tinyfpga/TinyFPGA-Programmer-Application


## CLI

```
> tinyprog --help
usage: tinyprog [-h] [-l] [-p PROGRAM] [-b] [-c COM]

optional arguments:
  -h, --help            show this help message and exit
  -l, --list            list connected and active TinyFPGA B-series boards
  -p PROGRAM, --program PROGRAM
                        program TinyFPGA board with the given bitstream
  -b, --boot            command the TinyFPGA B-series board to exit the
                        bootloader and load the user configuration
  -c COM, --com COM     serial port name
```

You can list valid ports with the `--list` option:

```
> tinyprog --list

    TinyFPGA B-series Programmer CLI
    --------------------------------
    Boards with active bootloaders:
        COM24

```

You can use the `--com` option to specify a specific port.  If you don't specify a port, it will use the first one in the list:

```
> tinyprog --program ..\icestorm_template\TinyFPGA_B.bin

    TinyFPGA B-series Programmer CLI
    --------------------------------
    Programming COM24 with ..\icestorm_template\TinyFPGA_B.bin
    Waking up SPI flash
    135100 bytes to program
    Erasing designated flash pages
    Writing bitstream
    Verifying bitstream
    Success!

```


## Testing

The tests can be run with [tox](https://tox.readthedocs.io/): just run the `tox` command.

The code coverage will be generated as HTML pages in the `htmlcov` directory.
