echo 'name of disk e.g /dev/sda, /dev/vda'
read DISK
umount $DISK
echo "unmount done"
sleep 1
printf "o\nn\np\n1\n\n\nw\n" | fdisk $DISK
echo "fdisk done"
sleep 1
mkfs.xfs "${DISK}1" -f
echo "format done"
sleep 1
mount "${DISK}1" /mnt
echo "mount done"
sleep 1
pacstrap /mnt base linux xfsprogs vim dhclient 
echo "linux install done"
sleep 1
echo "copying post-install script"
cp ./post-install.sh /mnt
arch-chroot /mnt ./post-install.sh
reboot


