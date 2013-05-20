tput setab 7
tput setaf 0
setterm -bold 
echo "      boot.img unpacker       "
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
tput sgr0
setterm -bold 
echo "Checking for boot.img"
if test -e boot.img
  then
   mkdir kernel
   mkdir ramdisk
   mkdir -p unpack
   echo "Splitting Kernel and Ramdisk"
tput setaf 6
./tools/unpackbootimg -i boot.img -o unpack 
   cp unpack/boot.img-zImage kernel/zImage 
   rm unpack/boot.img-zImage
tput sgr0
setterm -bold 
   echo "Extracting ramdisk" 
   cd ramdisk
   gzip -dc ../unpack/boot.img-ramdisk.gz | cpio -i 
   cd .. 
   rm -rf unpack
   echo " "
tput setaf 1
   echo "Extracted Kernel is in kernel/zImage"
   echo "Extracted Ramdisk is in ramdisk folder" 
tput sgr0
setterm -bold 
else clear
echo "boot.img not found!"
fi 
echo " "
echo "Press enter to exit"
read ANS
