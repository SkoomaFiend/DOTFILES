ip link
timedatectl set-ntp true 
mkfs.fat -F 32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p4
mkfs.ext4 /dev/nvme0n1p2
mkfs.ext4 /dev/nvme0n1p3
mount /dev/nvme0n1p2 /mnt
mkdir /mnt/home/
mount /dev/nvme0n1p3 /mnt/home
swapon /dev/nvme0n1p4
pacstrap -K /mnt base linux-zen linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
