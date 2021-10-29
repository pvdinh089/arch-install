#!/bin/bash

# Tạo swapfile
fallocate -l 5GB /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile none swap default 0 0" >> /etc/fstab

printf "\e[1;32m ĐÃ TẠO XONG SWAP \e[0m"
printf "\e[1;32m =================================== \e[0m \n"
sleep 5

# Đặt múi giờ và mã unicode
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
printf "\e[1;32m ĐÃ ĐẶT XONG GIỜ VÀ UTF-8 \e[0m"
printf "\e[1;32m =================================== \e[0m \n"
sleep 5

# Cấu hình mạng
echo "ArchLinux" >> /etc/hostname   #ArchLinux là tên PC
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 ArchLinux.localdomain ArchLinux" >> /etc/hosts
cat /etc/hosts

printf "\e[1;32m CẤU HÌNH MẠNG THÀNH CÔNG \e[0m"
printf "\e[1;32m =================================== \e[0m \n"
sleep 5

# Đặt mật khẩu cho user root
echo root:260691 | chpasswd

# Thêm người dùng
useradd -m -g wheel dinhpv          #dinhpv là tên người dùng
echo dinhpv:260691 | chpasswd
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers.d/dinhpv
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/dinhpv
printf "\e[1;32m ĐÃ TẠO XONG NGƯỜI DÙNG \e[0m"
printf "\e[1;32m =================================== \e[0m \n"
sleep 5

# Cài đặt các gói cơ bản
pacman -S --noconfirm grub efibootmgr os-prober ntfs-3g mtools 
pacman -S --noconfirm networkmanager network-manager-applet dialog wpa_supplicant dosfstools texinfo inetutils netctl dhcpcd linux-headers
printf "\e[1;32m XONG CÀI ĐẶT CÁC GÓI CƠ BẢN \e[0m"
printf "\e[1;32m =================================== \e[0m \n"
sleep 5

# Cài đặt GRUB
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub 
grub-mkconfig -o /boot/grub/grub.cfg
printf "\e[1;32m HOÀN THÀNH CÀI ĐẶT VÀ CẤU HÌNH GRUB \e[0m \n"
printf "\e[1;32m =================================== \e[0m \n"
sleep 5

# Cài đặt thêm các ứng dụng khác trợ khác
sudo pacman -S --noconfirm bluez bluez-utils alsa-utils pulseaudio firefox terminator nautilus git terminus-font ttf-ubuntu-font-family ttf-dejavu

# Cài đặt Driver card màn hình NVIDIA
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings
# pacman -S --noconfirm xf86-video-amdgpu

# Mở các dịch vụ cơ bản internet và bluetooth
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable dhcpcd.service
printf "\e[1;32m MỞ DỊCH VỤ INTERNET \e[0m \n"
printf "\e[1;32m =================================== \e[0m \n"
sleep 5
printf "\e[1;32m Đã hoàn thành cài đặt! gõ exit, umount -a và reboot.\e[0m \n"




