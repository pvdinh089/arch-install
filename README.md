# arch-install Dual boot with Windows 11
# CPU: intel - GPU: Nvidia
<b>1. Tạo phân vùng , định dạng các phân vùng </b></br>
    - Không cần tạo phân vùng swap </br>
    - Phân vùng boot - type: Linux root x86_64 </br>
    - Phân vùng EFI dùng chung với Windows </br>
    - Mount phân vùng /mnt </br>
    - Mount phân vùng /mnt/boot </br>
<b> 2. Tải repo này vào /mnt </b></br>
    Sửa tên PC, tên user + mật khẩu, mật khẩu cho user root trong file <b>install.sh</b> </br>
    Cấp quyền thực thi cho 2 tệp install.sh và install-base.sh </br>
    - Chạy tệp install-base.sh </br>
    - Chạy tệp install.sh </br>
  <b> 3. Sau đó cài DE hoặc WM </b>
