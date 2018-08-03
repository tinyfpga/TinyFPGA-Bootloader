#/!bin/sh
grep "version" cmdline.ggo | sed -e 's/.*"\(.*\)".*/\1/'
