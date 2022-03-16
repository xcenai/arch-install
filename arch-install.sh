umount /dev/sda1
echo "unmount done"
sleep 1
printf "o\nn\np\n1\n\n\nw\n" | fdisk /dev/sda
echo "fdisk done"
sleep 1
mkfs.xfs /dev/sda1 -f
echo "format done"
sleep 1
mount /dev/sda1 /mnt
echo "mount done"
sleep 1
pacstrap /mnt base linux xfsprogs vim dhclient 
echo "linux install done"
sleep 1
echo "copying post-install script"
cp ./post-install.sh /mnt
arch-chroot /mnt


