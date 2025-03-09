ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
locale-gen
touch /etc/locale.conf
echo LANG=en_US.UTF-8 > /etc/locale.conf
touch /etc/hostname
echo dan > /etc/hostname
mkinitcpio -P
pacman -S grub efibootmgr os-prober networkmanager dialog --noconfirm
mkdir /boot/EFI
mount /dev/nvme0n1p1 /boot/EFI
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S sudo vim
useradd -m -G wheel -s /bin/bash dan
