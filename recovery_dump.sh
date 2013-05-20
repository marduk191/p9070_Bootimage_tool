adb shell su -c 'dd if=/dev/block/platform/msm_sdcc.1/by-num/p18 of=/sdcard/recovery.img'
adb pull /sdcard/recovery.img
adb shell su -c 'rm /sdcard/recovery.img'
