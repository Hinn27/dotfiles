#  Hinn's Dotfiles - Git Bare Repository

Hệ thống quản lý cấu hình cá nhân tối giản, hiệu quả và không dùng Symlink.

---

## 🚀 Thiết lập trên máy mới (Quick Start)

Thực hiện các bước sau để khôi phục toàn bộ môi trường làm việc:

### 1. Cài đặt các ứng dụng cốt lõi
```bash
sudo pacman -Syu
# Cài đặt các công cụ quản lý và Shell
sudo pacman -S --needed base-devel git zoxide fzf starship zsh fastfetch
# Cài đặt Terminal và Editor
sudo pacman -S --needed kitty neovim niri noctalia-git mpv
```

### 2. Cài đặt Dotfiles
```bash
# Clone repo dưới dạng bare
git clone --bare git@github.com:Hinn27/dotfiles.git $HOME/.dotfiles

# Tạo alias tạm thời
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Checkout cấu hình (Backup file cũ nếu có xung đột)
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

### 3. Khôi phục tối ưu hóa hệ thống (Root required)
```bash
# Copy cấu hình từ System-Configs vào /etc/
sudo cp -r ~/System-Configs/etc/* /etc/

# Áp dụng Split Lock Mitigation (Tăng mượt cho CPU Intel)
sudo sysctl -p /etc/sysctl.d/99-splitlock.conf

# Kích hoạt Scheduler chuyên game (scx_lavd)
sudo systemctl daemon-reload
sudo systemctl enable --now scx_lavd
```

---

## 🎮 Tối ưu cho Gaming (Lưu ý quan trọng)

Để có hiệu năng chơi game tốt nhất trên CachyOS:

1.  **CachyOS Hello:** Mở ứng dụng **CachyOS Hello**, vào mục **Apps** và cài đặt gói **Gaming Packages**. Đây là bước quan trọng để có đầy đủ thư viện cần thiết.
2.  **Proton GE:** Cài đặt `protonup-qt` (`sudo pacman -S protonup-qt`), mở app và tải bản **GE-Proton** mới nhất cho Steam.
3.  **Steam Launch Options:** Luôn thêm lệnh tối ưu vào tùy chọn khởi chạy của game:
    `game-performance %command%`

---

## 📦 Danh sách ứng dụng & Lệnh cài đặt

| Ứng dụng | Lệnh cài đặt (Pacman/Paru) | Mô tả |
| :--- | :--- | :--- |
| **Niri** | `sudo pacman -S niri` | Window Manager chính |
| **Noctalia** | `sudo pacman -S noctalia-git` | Desktop Shell (JSON Config) |
| **Neovim** | `sudo pacman -S neovim` | Editor (LazyVim base) |
| **Kitty** | `sudo pacman -S kitty` | Terminal emulator |
| **Zsh** | `sudo pacman -S zsh` | Shell mặc định |
| **Starship** | `sudo pacman -S starship` | Prompt hiển thị |
| **Zoxide** | `sudo pacman -S zoxide` | Thay thế lệnh `cd` thông minh |
| **Fzf** | `sudo pacman -S fzf` | Bộ lọc tìm kiếm tương tác |

---

## 🛠️ Lệnh quản lý Dotfiles

Dùng alias `dotfiles` (đã được cấu hình trong `.zshrc`) để quản lý:

*   `dotfiles status` : Kiểm tra thay đổi.
*   `dotfiles add <file>` : Thêm file vào quản lý.
*   `dotfiles commit -m "message"` : Lưu thay đổi.
*   `dotfiles push` : Đẩy lên GitHub.
*   `dotfiles pull` : Cập nhật từ GitHub.

---
*Ghi chú: Repo này đã được tối ưu hóa cho CachyOS và card đồ họa NVIDIA.*
