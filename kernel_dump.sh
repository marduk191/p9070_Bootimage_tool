adb shell su -c 'dd if=/dev/block/mmcblk0p8 of=/sdcard/boot.img'
adb pull /sdcard/boot.img
adb shell su -c 'rm /sdcard/boot.img'
