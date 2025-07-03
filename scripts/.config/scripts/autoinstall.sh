#!/bin/bash
set -e

# TODO
# - Change sudoers file with awk

# NOTES
# 	Things you might have to edit : mount sizes, nvidia drivers
# 	If enter is outputing ^M or broke hit Ctrl+j for enter

read -p "Enter intel or amd for cpu drivers : " cputype
read -p "Enter your mount drive eg. /dev/nvme1 or /dev/sda : " drive
read -p "Enter your refresh rate : " refresh
read -p "Enter drive 2 eg. /dev/nvme0n1p3 " drivetwo

echo "Your drive is : $drive"
echo "Your Cpu type is $cputype"
echo "Your Refresh rate is $refresh"
echo "Your second drive is $drivetwo"
read -p "Press enter to continue"

# Get Your Cpu Type intel or amd
if [[ "$cputype" == "amd" ]]; then
  cputype="amd-ucode"
elif [[ "$cputype" == "intel" ]]; then
  cputype="intel-ucode"
fi

# Core Drive partitioning
if [[ "$drive" =~ nvme[0-1] ]]; then
  sudo parted -s $drive\n1 mklabel gpt
  sudo parted -s $drive\n1 mkpart ESP fat32 1MiB 1GiB
  sudo parted -s $drive\n1 set 1 esp on
  sudo parted -s $drive\n1 mkpart primary ext4 1GiB 45GiB
  sudo parted -s $drive\n1 mkpart primary ext4 45GiB 100%
  drive="${drive}n1p"
elif [[ "$drive" =~ sd[a-d] ]]; then
  sudo parted -s $drive mklabel gpt
  sudo parted -s $drive mkpart ESP fat32 1MiB 1GiB
  sudo parted -s $drive set 1 esp on
  sudo parted -s $drive mkpart primary ext4 1GiB 10GiB
  sudo parted -s $drive mkpart primary ext4 45GiB 100%
else
  echo "That is not a valid drive"
fi

# Format Partitions
mkfs.fat -F32 $drive\1
mkfs.ext4 $drive\2
mkfs.ext4 $drive\3

# Mount Partitions
mount $drive\2 /mnt
mkdir -p /mnt/boot/efi /mnt/home
mount $drive\1 /mnt/boot/efi
mount $drive\3 /mnt/home

# Run Reflector - Mirrors should be Replaced after running pacstrap
sudo sed -i 's/= 5/= 10/' /etc/pacman.conf
sudo reflector --country US --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo sed -i '/^\s*#\[multilib\]/,/^\s*#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' /etc/pacman.conf

# System Packages
sudo pacstrap -K /mnt base base-devel linux-zen linux-zen-headers linux-firmware networkmanager

# Nvidia - Must be before other packages such as steam because if not pacstrap will use default options
sudo pacstrap /mnt nvidia-dkms nvidia-utils lib32-nvidia-utils

# Other
sudo pacstrap /mnt $cputype ntfs-3g networkmanager pipewire wireplumber pipewire-audio pipewire-pulse rtkit openssh git stow bluez bluez-utils

# Sets Parallel Downloading and adds multilib that is required to download some packages
sudo sed -i 's/= 5/= 10/' /mnt/etc/pacman.conf
sudo sed -i '/^\s*#\[multilib\]/,/^\s*#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' /mnt/etc/pacman.conf
# GRUB
sudo pacstrap /mnt grub efibootmgr os-prober

# Packages
sudo pacstrap /mnt hyprland fish mpv kitty tealdeer yazi keyd ly firefox nvim steam bat-extras borg timeshift bottom waybar wofi gamemode unzip fd wl-clipboard cronie

# Generate fstab and mount windows
mkdir -p /mnt/mnt/windows
mount $drivetwo /mnt/mnt/windows
genfstab -U /mnt >>/mnt/etc/fstab

# Localization
sudo ln -sf /mnt/usr/share/zoneinfo/America/New_York /mnt/etc/localtime

arch-chroot /mnt /bin/bash <<EOF
set -e
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > etc/locale.conf
hwclock --systohc
yes "dan" | passwd 
echo 'dan' > /etc/hostname
useradd -m -G wheel dan
yes "dan" | passwd dan
sed -i '/OS_PROBER=/s/^#//' /etc/default/grub
su dan 
mkdir /home/dan/dotfiles
git clone https://github.com/SkoomaFiend/DOTFILES.git /home/dan/dotfiles
sed -i "/monitor=/c\monitor= , 1920x1080@${refresh}, 0x0, 1" /home/dan/dotfiles/hypr/.config/hypr/hyprland.conf
EOF

sudo visudo /mnt/etc/sudoers
