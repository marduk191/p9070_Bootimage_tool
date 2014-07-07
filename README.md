Boot image toolkit
for the Pantech Burst/p9070/Presto
By: marduk191
Version 2.0


You can use the flag -h for a short description of how to use any of the scripts.

1.dump

   Usage: ./dump <switch>
   
   Options:
    -r	Dumps a copy of recovery.img from the device
    -b	Dumps a copy of boot.img from the device

2.clean
 
   Usage: ./clean
  
    Cleans out images and split folders from the working directory.
    You will lose anything that is not backed up outside of this folder.
    This resets the folder to original working condition unless you
    added your own files or folers. It will not delete custom folders
    so that you can keep archives.

3.log

   Usage: ./log <flag>

   Options
     -a dumps kmsg, dmesg, and logcat to the logs directory."
     -d dumps dmesg to the logs directory."
     -k dumps kmsg to the logs directory."
     -l dumps logcat to the logs directory."
   
   Example: ./log -a
     to log kmsg, dmesg, and logcat.

4.pack

     ./pack -k: packs boot.img
     ./pack -r: packs recovery.img
    Padding is added so they are able to tempboot.

5.pad

     ./pad -b: pads boot.img
     ./pad -r: pads recovery.img

6.tmpboot

     ./tmpboot -b: Temp boots a boot.img
     ./tmpboot -r: Temp boots a recovery.img 

7.kernel_extract.sh
   
    This will split your boot.img into a kernel and ramdisk
    folder. Be sure to have anything left over from
    previous projects in a safe place as this will clean up
    all the old trash.

8.recovery_extract.sh

    This will extract your recovery.img into a kernel and ramdisk
    folders.

9.kernel_pack_cwm.sh

    This will make a recovery zip file to flash your kernel
    from recovery. It is compiled from your ramdisk and kernel folders.

10.recovery_pack_cwm.sh

    This will make a recovery zip file to flash your recovery
    from recovery (or temp recovery lol). It is compiled from your
    ramdisk and kernel folders. Be sure to clear your cache after
    flashing and before you reboot to remove old scripts.

  
