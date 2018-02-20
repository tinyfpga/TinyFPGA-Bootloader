def main():
    import sys
    import argparse
    import serial
    from serial.tools.list_ports import comports
    from tinyfpgab import TinyFPGAB

    parser = argparse.ArgumentParser()

    parser.add_argument("-l", "--list", action="store_true",
                        help="list connected and active TinyFPGA B-series "
                             "boards")
    parser.add_argument("-p", "--program", type=str,
                        help="program TinyFPGA board with the given bitstream")
    parser.add_argument("-b", "--boot", action="store_true",
                        help="command the TinyFPGA B-series board to exit the "
                             "bootloader and load the user configuration")
    parser.add_argument("-c", "--com", type=str, help="serial port name")
    parser.add_argument("-d", "--device", type=str, default="1209:2100",
                        help="device id (vendor:product); default is "
                             "TinyFPGA-B (1209:2100)")
    parser.add_argument("-a", "--addr", type=int,
                        help="force the address to write the bitstream to")

    args = parser.parse_args()

    print ""
    print "    TinyFPGA B-series Programmer CLI"
    print "    --------------------------------"

    device = args.device.lower().replace(':', '')
    if len(device) != 8 or not all(c in '0123456789abcdef' for c in device):
        print "    Invalid device id, use format vendor:product"
        sys.exit(1)
    device = '{}:{}'.format(device[:4], device[4:])
    print "    Using device id {}".format(device)
    active_boards = [p[0] for p in comports() if device in p[2]]

    # find port to use
    active_port = None
    if args.com is not None:
        active_port = args.com
    elif not active_boards:
        print "    No port was specified and no active bootloaders found."
        print "    Activate bootloader by pressing the reset button."
        sys.exit(1)
    elif len(active_boards) == 1:
        print "    Only one board with active bootloader, using it."
        active_port = active_boards[0]
    else:
        print "    Please choose a board with the -c option."

    # list boards
    if args.list or active_port is None:
        print "    Boards with active bootloaders:"
        for p in active_boards:
            print "        " + p
        if len(active_boards) == 0:
            print "        No active bootloaders found.  Check USB connections"
            print "        and press reset button to activate bootloader."

    # program the flash memory
    elif args.program is not None:
        print "    Programming " + active_port + " with " + args.program

        def progress(info):
            if isinstance(info, str):
                print "    " + info

        for attempt in range(3):
            with serial.Serial(active_port, 115200, timeout=0.2,
                               writeTimeout=0.2) as ser:
                fpga = TinyFPGAB(ser, progress)
                (addr, bitstream) = fpga.slurp(args.program)
                if args.addr is not None:
                    addr = args.addr
                if addr < 0:
                    print "    Negative write addr: {}".format(addr)
                    sys.exit(1)
                #if addr + len(bitstream) >= 0x400000:
                #    print "    Write addr over 4Mio: {}".format(addr)
                #    sys.exit(1)
                if not fpga.is_bootloader_active():
                    print "    Bootloader not active"
                    continue
                print "    Programming at addr {:06x}".format(addr)
                if fpga.program_bitstream(addr, bitstream):
                    sys.exit(0)
                else:
                    continue

    # boot the FPGA
    if args.boot:
        print "    Booting " + active_port
        with serial.Serial(active_port, 115200, timeout=0.2,
                           writeTimeout=0.2) as ser:
            fpga = TinyFPGAB(ser)
            fpga.boot()

if __name__ == '__main__':
    main()
