from tinyprog import TinyProg, get_ports
import tinyprog
from six.moves.urllib.request import urlopen
from six.moves import input
import sys
import argparse
import json
from packaging import version
import time

# adapted from http://code.activestate.com/recipes/577058/
def query_user(question, default="no"):
    """Ask a yes/no question via raw_input() and return their answer.

    "question" is a string that is presented to the user.
    "default" is the presumed answer if the user just hits <Enter>.
        It must be "yes" (the default), "no" or None (meaning
        an answer is required of the user).

    The "answer" return value is True for "yes" or False for "no".
    """

    valid = {"yes": True, "y": True, "ye": True,
             "no": False, "n": False}
    if default is None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif default == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '%s'" % default)

    while True:
        sys.stdout.write(question + prompt)
        choice = input().lower()
        if default is not None and choice == '':
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' "
                             "(or 'y' or 'n').\n")


def strict_query_user(question):
    valid = {"yes": True}

    prompt = " [yes/NO] > "

    while True:
        sys.stdout.write(question + prompt)
        choice = input().lower()
        return valid.get(choice, False)


def get_port_by_uuid(device, uuid):
    ports = get_ports(device) + get_ports("1209:2100")
    for port in ports:
        try:
            with port:
                p = TinyProg(port)
                if p.meta.uuid().startswith(uuid):
                    return port

        except:
            pass
    return None


def check_for_new_bootloader():
    #ports = [p[0] for p in comports() if "1d50:6130" in p[2].lower()]

    # download bootloader update information
    #bootloader_update_info = urlopen(m[u"bootmeta"][u"update"] + "/bootloader.json").read()
    return []


def check_for_wrong_tinyfpga_bx_vidpid():
    """
    Some of the TinyFPGA BX boards have the wrong USB VID:PID.  This function
    looks for such boards.
    """
    boards_needing_update = []

    ports = get_ports("1209:2100")
    for port in ports:
        with port:
            p = TinyProg(port)
            m = p.meta.root
            if m[u"boardmeta"][u"name"] == u"TinyFPGA BX":
                boards_needing_update.append(port)

    return boards_needing_update


def check_if_overwrite_bootloader(addr, length, userdata_range):
    ustart = userdata_range[0]
    uend = userdata_range[1]

    if addr < ustart or addr + length >= uend:
        print("")
        print("    !!! WARNING !!!")
        print("")
        print("    The address given may overwrite the USB bootloader. Without the")
        print("    USB bootloader the board will no longer be able to be programmed")
        print("    over the USB interface. Without the USB bootloader, the board can")
        print("    only be programmed via the SPI flash interface on the bottom of")
        print("    the board")
        print("")
        retval = strict_query_user("    Are you sure you want to continue? Type in 'yes' to overwrite bootloader.")
        print("")
        return retval

    return True


def perform_bootloader_update(port):
    uuid = None

    with port:
        p = TinyProg(port)
        m = p.meta.root

        uuid = m[u"boardmeta"][u"uuid"]

        # download bootloader update information
        bootloader_update_info = json.loads(urlopen(m[u"bootmeta"][u"update"] + "/bootloader.json").read())

        # ask permission to update the board
        print("")
        print("    The following update:")
        print("")
        print("        New Version: %s" % bootloader_update_info[u"version"])
        print("        Notes: %s" % bootloader_update_info[u"notes"])
        print("")
        print("    is available for this board:")
        print_board(port, m)
        print("")
        
        if query_user("    Would you like to perform the update?"):
            ####################
            # STAGE ONE 
            ####################
            print("    Fetching stage one...")
            bitstream = urlopen(bootloader_update_info[u"stage_one_url"]).read()

            print("    Programming stage one...")
            userimage_addr = p.meta.userimage_addr_range()[0]
            if p.program_bitstream(userimage_addr, bitstream):
                p.boot()
                print("    ...Success!")
            else:
                print("    ...Failure, try again!")
                return False
        else:
            print("    Update cancelled by user.")
            return False

    sys.stdout.write("    Waiting for stage one to reconnect...")
    sys.stdout.flush()

    new_port = None

    for x in range(20):
        time.sleep(1)
        sys.stdout.write(".")
        sys.stdout.flush()
        new_port = get_port_by_uuid("1d50:6130", uuid)
        if new_port is not None:
            print("connected!")
            break
    
    with new_port:
        p = TinyProg(new_port)

        ####################
        # STAGE TWO 
        ####################
        print("    Fetching stage two...")
        bitstream = urlopen(bootloader_update_info[u"stage_two_url"]).read()

        print("    Programming stage two...")
        if p.program_bitstream(0, bitstream):
            p.boot()
            print("    ...Success!\n")
            return True
        else:
            print("    ...Failure, try again!")
            return False


def print_board(port, m):
    if isinstance(m, dict) and u"boardmeta" in m:
        print("")
        print("        %s: %s %s" % (port, m[u"boardmeta"][u"name"], m[u"boardmeta"][u"hver"]))
        print("            UUID: %s" % m[u"boardmeta"][u"uuid"])
        print("            FPGA: %s" % m[u"boardmeta"][u"fpga"])
    else:
        print("")
        print("        %s: No metadata" % (port))


def main():
    def parse_int(str_value):
        str_value = str_value.strip().lower()
        if str_value.startswith("0x"):
            return int(str_value[2:], 16)
        else:
            return int(str_value)

    parser = argparse.ArgumentParser()

    parser.add_argument("-l", "--list", action="store_true",
                        help="list connected and active FPGA boards")
    parser.add_argument("-p", "--program", type=str,
                        help="program FPGA board with the given user bitstream")
    parser.add_argument("-u", "--program-userdata", type=str,
                        help="program FPGA board with the given user data")
    parser.add_argument("--program-image", type=str,
                        help="program FPGA board with a combined user bitstream and data")
    parser.add_argument("-b", "--boot", action="store_true",
                        help="command the FPGA board to exit the "
                             "bootloader and load the user configuration")
    parser.add_argument("-c", "--com", type=str, help="serial port name")
    parser.add_argument("-i", "--id", type=str, help="FPGA board ID")
    parser.add_argument("-d", "--device", type=str, default="1d50:6130",
                        help="device id (vendor:product); default is (1d50:6130)")
    parser.add_argument("-a", "--addr", type=str,
                        help="force the address to write the bitstream to")
    parser.add_argument("-m", "--meta", action="store_true",
                        help="dump out the metadata for all connected boards in JSON")
    parser.add_argument("--update-bootloader", action="store_true",
                        help="check for new bootloader and update eligible connected boards")
    parser.add_argument("--libusb", action="store_true",
                        help="try using libusb to connect to boards without a serial driver attached")
    parser.add_argument("--pyserial", action="store_true",
                        help="use pyserial to connect to boards")

    args = parser.parse_args()

    device = args.device.lower().replace(':', '')
    if len(device) != 8 or not all(c in '0123456789abcdef' for c in device):
        print("    Invalid device id, use format vendor:product")
        sys.exit(1)
    device = '{}:{}'.format(device[:4], device[4:])

    tinyprog.use_libusb = args.libusb
    tinyprog.use_pyserial = args.pyserial

    active_boards = get_ports(device) + get_ports("1209:2100")

    if args.meta:
        meta = []
        for port in active_boards:
            with port:
                p = TinyProg(port)
                m = p.meta.root
                m["port"] = str(port)
                meta.append(m)
        print(json.dumps(meta, indent=2))
        sys.exit(0)

    print("")
    print("    TinyProg CLI")
    print("    ------------")
    
    print("    Using device id {}".format(device))


    # find port to use
    active_port = None
    if args.com is not None:
        active_port = tinyprog.SerialPort(args.com)

    elif args.id is not None:
        active_port = get_port_by_uuid(device, args.id)

    elif not active_boards:
        print("    No port was specified and no active bootloaders found.")
        print("    Activate bootloader by pressing the reset button.")
        sys.exit(1)

    elif len(active_boards) == 1:
        print("    Only one board with active bootloader, using it.")
        active_port = active_boards[0]

    else:
        print("    Please choose a board with the -c or -i option.  Using first board in list.")
        active_port = active_boards[0]


    # list boards
    if args.list or active_port is None:
        print("    Boards with active bootloaders:")
        for port in active_boards:
            with port:
                p = TinyProg(port)
                m = p.meta.root
                print_board(port, m)

        if len(active_boards) == 0:
            print("        No active bootloaders found.  Check USB connections")
            print("        and press reset button to activate bootloader.")

    if args.update_bootloader:
        boards_needing_update = (
            check_for_wrong_tinyfpga_bx_vidpid() +
            check_for_new_bootloader()
        )

        if len(boards_needing_update) == 0:
            print("    All connected and active boards are up to date!")
        else:
            for port in boards_needing_update:
                perform_bootloader_update(port)

    # program the flash memory
    if (args.program is not None) or (args.program_userdata is not None) or (args.program_image is not None):
        boot_fpga = False
        def progress(info):
            if isinstance(info, str):
                print("    " + str(info))

        with active_port:
            fpga = TinyProg(active_port, progress)

            if args.program is not None:
                print("    Programming " + str(active_port) + " with " + str(args.program))

                bitstream = fpga.slurp(args.program)
                
                if args.addr is not None:
                    addr = parse_int(args.addr)
                else:
                    addr = fpga.meta.userimage_addr_range()[0]

                if addr < 0:
                    print("    Negative write addr: {}".format(addr))
                    sys.exit(1)
                if not fpga.is_bootloader_active():
                    print("    Bootloader not active")
                    sys.exit(1)

                if check_if_overwrite_bootloader(addr, len(bitstream), fpga.meta.userimage_addr_range()):
                    boot_fpga = True
                    print("    Programming at addr {:06x}".format(addr))
                    if not fpga.program_bitstream(addr, bitstream):
                        sys.exit(1)
    

            # program user flash area
            if args.program_userdata is not None:
                print("    Programming " + str(active_port) + " with " + str(args.program_userdata))

                bitstream = fpga.slurp(args.program_userdata)

                if args.addr is not None:
                    addr = parse_int(args.addr)
                else:
                    addr = fpga.meta.userdata_addr_range()[0]

                if addr < 0:
                    print("    Negative write addr: {}".format(addr))
                    sys.exit(1)
                if not fpga.is_bootloader_active():
                    print("    Bootloader not active")
                    sys.exit(1)

                if check_if_overwrite_bootloader(addr, len(bitstream), fpga.meta.userdata_addr_range()):
                    boot_fpga = True
                    print("    Programming at addr {:06x}".format(addr))
                    if not fpga.program_bitstream(addr, bitstream):
                        sys.exit(1)
    

            # program user image and data area
            if args.program_image is not None:
                print("    Programming " + str(active_port) + " with " + str(args.program_image))

                bitstream = fpga.slurp(args.program_image)

                if args.addr is not None:
                    addr = parse_int(args.addr)
                else:
                    addr = fpga.meta.userimage_addr_range()[0]

                if addr < 0:
                    print("    Negative write addr: {}".format(addr))
                    sys.exit(1)
                if not fpga.is_bootloader_active():
                    print("    Bootloader not active")
                    sys.exit(1)

                if check_if_overwrite_bootloader(addr, len(bitstream), (fpga.meta.userimage_addr_range()[0], fpga.meta.userdata_addr_range()[1])):
                    boot_fpga = True
                    print("    Programming at addr {:06x}".format(addr))
                    if not fpga.program_bitstream(addr, bitstream):
                        sys.exit(1)

            if boot_fpga:
                fpga.boot()
                print("")
                sys.exit(0)

    # boot the FPGA
    if args.boot:
        print("    Booting " + str(active_port))
        with active_port:
            fpga = TinyProg(active_port)
            fpga.boot()

    print("")


if __name__ == '__main__':
    main()
