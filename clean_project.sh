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
if test -e boot.img
then rm boot.img
fi
if test -e recovery.img
then rm recovery.img
fi
