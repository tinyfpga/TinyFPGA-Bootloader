ULX3S ECP5 FPGA
---

To bootstrap the bootloader:

* `make` should build `bootloader.bit`
* Connect both USB ports `US1` and `US2` to the computer
* `sudo ujprog bootloader.bit` will load it into the FPGA SRAM via US1
* The TinyFPGA bootloader should enumerate as `/dev/ttyACM0` via US2
* Load the security pages into the SPI flash SFDP pages:
```
sudo tinyprog -a 1 --security boardmeta.json
sudo tinyprog -a 2 --security bootmeta.json
```
* `tinyprog -m` should now show the meta data
* `tinyprog -a 0 --program-image fw.bin` should write the multiboot image into the flash
* Disconnect both the USB ports and reconnect just US2.
* The bootloader should be running and flashing LED0, and show up again as `/dev/ttyACM0`
* Load your own user image with `tinyprog -p userimage.bit`

----

Maybe that no longer works?  Had to write the 
