p9070_Bootimage_tool
====================

Tool for working with boot and recovery images on the Pantech Burst. It's useable but the readme has some wrong file names and this is being worked on a little to clean stuff up.


Boot image toolkit for the Pantech Burst/p9070/Presto
By: marduk191
Version 1.0


Instead of making a silly menu system, I just included them as seperate executable bash scripts.


1. clean_project
  
  Cleans out images and split files from the working directory.
  You will lose anything that is not backed up outside of this folder.

2. extract_boot.sh
   
   This will split your boot.img into a kernel and ramdisk.
   Be sure to have anything left over from previous projects
   in a safe place as this will clean up all the old trash.

3. extract_recovery.sh

   This will extract your recovery.img into a kernel and ramdisk.

4. pack_kernel.sh

   This will pack your kernel and ramdisk into a working boot.img.
   It also adds the proper padding needed for the Pantech Burst.

5. pack_kernel_cwm.sh

   This will make a Clockworkmod zip file to flash your kernel
   from recovery. It is compiled from your ramdisk and kernel files.

6. pack_recovery.sh
   This will pack your kernel and ramdisk into a working recovery.img.
   It also adds the proper padding needed for the Pantech Burst.

7. pack_recovery_cwm.sh

   This will make a Clockworkmod zip file to flash your recovery
   from recovery (or temp recovery lol). It is compiled from your
   ramdisk and kernel files.
  
