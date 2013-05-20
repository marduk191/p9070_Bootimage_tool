adb reboot bootloader
fastboot wait-for-device
fastboot boot ./out/recovery.img
