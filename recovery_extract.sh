tput setab 7
tput setaf 0
setterm -bold 
echo "       Recovery unpacker      "
echo "For Pantech Burst/p9070/presto"
echo "         By marduk191         "
tput sgr0 
setterm -bold 
tput setaf 1
echo "Cleaning old files"
if test -d ramdisk
then rm -rf ramdisk
fi
if test -d kernel
then rm -rf kernel
fi
if test -d out
then rm -rf out
fi
tput setaf 7
echo "Checking for recovery.img"
if test -e recovery.img
  then
   mkdir kernel
   mkdir ramdisk
   mkdir -p unpack
   echo "Splitting Kernel and Ramdisk" 
   ./tools/unpackbootimg -i recovery.img -o unpack 
   cp unpack/recovery.img-zImage kernel/zImage 
   rm unpack/recovery.img-zImage
   echo "Extracting ramdisk" 
   cd ramdisk
   gzip -dc ../unpack/recovery.img-ramdisk.gz | cpio -i 
   cd .. 
   rm -rf unpack
   tput setaf 1
   echo "Extracted Kernel is in kernel/zImage"
   echo "Extracted Ramdisk is in ramdisk folder" 
tput sgr0
setterm -bold 
else clear
echo "recovery.img not found!"
fi 
echo " "
echo "Press enter to exit"
read ANS
