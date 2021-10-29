# Cài đặt các gói cơ bản
pacstrap /mnt base base-devel linux linux-firmware vim intel-ucode
printf "\e[1;32m CÀI XONG CÁC GÓI CƠ BẢN \e[0m \n"
sleep 10
# Cấu hình hệ thống
genfstab -U /mnt >> /mnt/etc/fstab
printf "\e[1;32m CẤU HÌNH HỆ THỐNG THÀNH CÔNG \e[0m \n"
sleep 5
# Chuyển sang người dùng root
arch-chroot /mnt
printf "\e[1;32m ĐÃ CHUYỂN SANG NGƯỜI DÙNG ROOT \e[0m \n"