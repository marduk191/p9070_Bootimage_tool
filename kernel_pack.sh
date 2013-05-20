tput setab 7
tput setaf 0
setterm -bold 
echo "      boot.img repacker       "
echo "For Pantech Burst/p9070/presto"
echo "         By marduk191         "
tput sgr0 
setterm -bold
echo "Checking for kernel"
if test -e kernel/zImage
   then echo "Found!"
else echo "Kernel not found!"
   exit 
fi
echo "Checking for Ramdisk"
if test -d ramdisk 
then echo "Found!" 
else echo "Ramdisk not found!"
exit 
fi
echo "Kernel and Ramdisk found, preparing ramdisk"
sleep 2 
./tools/mkbootfs ramdisk | gzip > ramdisk.gz
sleep 2
echo "Packing boot.img"
mkdir -p out
./tools/mkbootimg --kernel kernel/zImage --ramdisk ramdisk.gz --cmdline 'console=ttyHSL0,115200,n8 androidboot.hardware=qcom loglevel=0' --board presto --base 0x40200000 --ramdiskaddr 0x41400000 --output out/boot.img
sleep 2
echo "Adding padding"
dd if=/dev/zero of=out/boot.img bs=4096 count=1 oflag=append conv=notrunc
sleep 2
rm ramdisk.gz
s1=`ls -lh boot.img | sed -e 's/.* [ ]*\([0-9]*\.[0-9]*[MK]\) .*/\1/g'`
cd out 
s2=`ls -lh boot.img | sed -e 's/.* [ ]*\([0-9]*\.[0-9]*[MK]\) .*/\1/g'`
tput setaf 6
echo "Size of old imgage: $s1"
echo "Size of new image: $s2"
tput setaf 1 
echo "Final boot.img is in out/boot.img"
tput sgr0
echo "Done, press enter to exit"
read ANS
