./tools/5652rgb -rle < logo.rle > logo.raw
sleep 2
convert -depth 8 -size 320x480 rgb:logo.raw logo.png
