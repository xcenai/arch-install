ln -sf /usr/share/zoneinfo/America/St_Lucia /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'arch' > /etc/hostname
pacman --noconfirm -S amd-ucode grub
grub-install /dev/sda
