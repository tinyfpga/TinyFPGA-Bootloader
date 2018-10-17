# Xilinx 7 Series support

This implementation is for the Arty using xc7a35tcsg324 but should work for any 7 series device.

## pinout

This implementation uses the upper row of the JB PMOD.  You can find a small pcb at [oshpark](https://oshpark.com/shared_projects/UDlBSFXa).  Oshpark are very generous with their community support, please support them.  You can find the source files for the pcb in my [github repo](https://github.com/TomKeddie/prj-pmod/tree/master/hardware/pmod-usb-raw).  The PCB has both micro and mini usb, you can use either but not both!

```
set_property PACKAGE_PIN C15 [get_ports pin_led]
set_property PACKAGE_PIN D15 [get_ports pin_pu]
set_property PACKAGE_PIN E16 [get_ports pin_usbn]
set_property PACKAGE_PIN E15 [get_ports pin_usbp]
```

## prom file generation

The file initially programmed into the PROM needs to have both the bootloader and XML metadata for the bootloader.  I provide an example in this directory (Digilent-Arty.json) and a script to merge the bootloader fpga image and the json metadata.  The metadata needs to be aligned at a specific address, you can see the address table in the json file.  The bootloader python code searches for the metadata so it can be moved if your bootloader image is larger.

PLEASE GENERATE YOUR OWN UUID FOR YOUR JSON.

```
tom@z400:~/git/TomKeddie/TinyFPGA-Bootloader/boards/Digilent-Arty$ ./generate_bin.sh Digilent-Arty.runs/impl_1/bootloader.bin Digilent-Arty.json output.bin 
File size is 401908 bytes
Generating 642572 bytes of padding
```

## initial prom file programming

You can program the file using the Vivado hardware manager.  You need to add the flash chip (MQ25QL128-spi-x1-x2-x4) manually.  You should erase the entire device as the json data can be appear to be corrupted if there is other data trailing it.

## bootloader software usage

```
tom@z400:~/git/TomKeddie/TinyFPGA-Bootloader/boards/Digilent-Arty$ python -m tinyprog -l

    TinyProg CLI
    ------------
    Using device id 1d50:6130
    Only one board with active bootloader, using it.
    Boards with active bootloaders:

        /dev/ttyACM0: Digilent Arty-7 Rev C
            UUID: 75dea31e-c9ae-11e8-a8d5-f2801f1b9fd1
            FPGA: Xilinx XC7A35T

tom@z400:~/git/TomKeddie/TinyFPGA-Bootloader/boards/Digilent-Arty$ python -m tinyprog -p ~/tmp/project_1/project_1.runs/impl_1/top1.bin 

    TinyProg CLI
    ------------
    Using device id 1d50:6130
    Only one board with active bootloader, using it.
    Programming /dev/ttyACM0 with /home/tom/tmp/project_1/project_1.runs/impl_1/top1.bin
    Programming at addr 100000
    Waking up SPI flash
    214420 bytes to program
    Erasing: 100%|#######################################################| 214k/214k [00:01<00:00, 182kB/s]
    Writing: 100%|#######################################################| 214k/214k [00:01<00:00, 184kB/s]
    Reading: 100%|#######################################################| 214k/214k [00:00<00:00, 380kB/s]
    Success!

```


## design references

 * [UG470](https://www.xilinx.com/support/documentation/user_guides/ug470_7Series_Config.pdf)
 * [ICAPE2 with bit swapping](https://github.com/ptracton/Picoblaze/blob/master/Picoblaze/Reference_Designs/ICAP/kc705_kcpsm6_icap.vhd)
