tput setab 7
tput setaf 0
setterm -bold 
echo "Kernel repacker for CWM flashing"
echo " For Pantech Burst/p9070/presto "
echo "          By marduk191          "
tput sgr0 
setterm -bold
echo "Checking for Kernel"
if test -e kernel/zImage
   then echo "zImage found"
else echo "Kernel not found!"
   exit 
fi
echo "Checking for Ramdisk"
if test -d ramdisk 
then echo "Ramdisk found" 
else echo "Ramdisk not found!"
exit 
fi

echo "Kernel and Ramdisk found, preparing ramdisk"
sleep 2 
./tools/mkbootfs ramdisk | gzip > ramdisk.gz
sleep 2
echo "Packing recovery.img"
mkdir -p out
./tools/mkbootimg --kernel kernel/zImage --ramdisk ramdisk.gz --cmdline 'console=ttyHSL0,115200,n8 androidboot.hardware=qcom loglevel=0' --board presto --base 0x40200000 --ramdiskaddr 0x41400000 --output out/recovery.img
sleep 2
echo "Adding padding"
dd if=/dev/zero of=out/recovery.img bs=4096 count=1 oflag=append conv=notrunc
sleep 2
rm ramdisk.gz
echo "recovery.img ready!"
echo "Making CWM Flashable zip file"
cd out 
cp -r ../tools/META-INF2 META-INF
zip -r p9070_Recovery.zip META-INF recovery.img 
rm -r META-INF 
cd ..
s1=`ls -lh recovery.img | sed -e 's/.* [ ]*\([0-9]*\.[0-9]*[MK]\) .*/\1/g'`
cd out 
s2=`ls -lh recovery.img | sed -e 's/.* [ ]*\([0-9]*\.[0-9]*[MK]\) .*/\1/g'`
rm boot.img 
tput setaf 6
echo "Size of old recovery: $s1" 
echo "Size of new recovery: $s2"
tput setaf 1
echo "Flashable recovery is in  out/p9070_Recovery.zip"
tput sgr0
setterm -bold
echo "Done, press enter to exit"
tput sgr0
read ANS
