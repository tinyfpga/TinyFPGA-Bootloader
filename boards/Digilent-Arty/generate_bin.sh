#!/bin/sh
[ $# -ne 3 ] && echo "usage ${0} bootloader_bin_file json_file output_file" && exit -1
bootloader_filename=${1}
json_filename=${2}
output_filename=${3}
pad_filename=${1}.pad
region_size=0x100000
json_size=0x1000
file_size=$(stat -c%s ${bootloader_filename})
echo "File size is ${file_size} bytes"
pad_size=$((${region_size} - ${file_size} - ${json_size}))
echo "Generating ${pad_size} bytes of padding"
pad_size_1k=$((${pad_size} / 1024))
pad_size=$((${pad_size} - ${pad_size_1k}*1024))
dd if=/dev/zero of=${pad_filename} bs=1024 count=${pad_size_1k} >/dev/null 2>&1
dd if=/dev/zero of=${pad_filename} bs=1 count=${pad_size} oflag=append conv=notrunc >/dev/null 2>&1
cat ${bootloader_filename} ${pad_filename} ${json_filename} > ${output_filename}
