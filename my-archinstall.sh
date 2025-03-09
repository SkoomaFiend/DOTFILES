ip link
timedatectl set-ntp true 
sfdisk -d --quiet /dev/nvme0n1 > nvme.dump
mkfs.fat -F 32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p4
mkfs.ext4 /dev/nvme0n1p2
mkfs.ext4 /dev/nvme0n1p3
mount /dev/nvme0n1p2 /mnt
mkdir /mnt/home/
mount /dev/nvme0n1p3 /mnt/home
swapon /dev/nvme0n1p4
pacstrap -K /mnt base linux-zen linux-zen-headers linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
mv ./install-in-root.sh /mnt  
arch-chroot /mnt /bin/bash -c "./install-in-root.sh"
