# Cài đặt các gói cơ bản
pacstrap /mnt base base-devel linux linux-firmware vim intel-ucode

# Cấu hình hệ thống
genfstab -U /mnt >> /mnt/etc/fstab

# Chuyển sang người dùng root
arch-chroot /mnt