tput setaf 6
setterm -bold 
echo "Kernel repacker for CWM flashing"
echo "For Pantech Burst/p9070/presto"
echo "By marduk191"
tput sgr0 
setterm -bold
echo "Checking for Kernel"
if test -e kernel/zImage
   then echo "zImage found"
else echo "Kernel not found!"
   tput sgr0
   exit 
fi
echo "Checking for Ramdisk"
if test -d ramdisk 
then echo "Ramdisk found" 
else echo "Ramdisk not found!"
tput sgr0
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
setterm -bold 
rm ramdisk.gz
echo "boot.img ready!"
echo "Making CWM Flashable zip file"
cd out 
cp -r ../tools/META-INF META-INF
zip -r p9070_Kernel.zip META-INF boot.img 
rm -r META-INF 
cd ..
s1=`ls -lh boot.img | sed -e 's/.* [ ]*\([0-9]*\.[0-9]*[MK]\) .*/\1/g'`
cd out 
s2=`ls -lh boot.img | sed -e 's/.* [ ]*\([0-9]*\.[0-9]*[MK]\) .*/\1/g'`
rm boot.img 
tput setaf 3
echo "Size of old boot.img: $s1" 
echo "Size of new boot.img: $s2"
tput setaf 1
echo "Flashable zip is out/p9070_KERNEL.zip"
tput sgr0
setterm -bold
echo "All Done, press enter to exit"
tput sgr0
read ANS
