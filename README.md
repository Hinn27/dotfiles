# Dotfiles Management - Git Bare Repository

Hệ thống quản lý cấu hình cá nhân tối giản sử dụng phương pháp **Git Bare Repository**.

## 🛠️ Các bước thiết lập sau khi cài lại CachyOS
Thực hiện theo thứ tự này để có lại hệ thống hoàn chỉnh:

### 1. Cài đặt các gói phần mềm cơ bản
Mở terminal và chạy lệnh để cài các công cụ thiết yếu:
```bash
sudo pacman -Syu
sudo pacman -S --needed base-devel git zoxide fzf cachyos-gaming-meta protonup-qt
```

### 2. Thiết lập Dotfiles (Bare Repository)
```bash
# Clone repo về dưới dạng bare
git clone --bare git@github.com:Hinn27/dotfiles.git $HOME/.dotfiles

# Tạo alias tạm thời để checkout
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Backup file cũ nếu có xung đột và checkout
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

### 3. Khôi phục tối ưu hóa hệ thống (Optimization)
Các thiết lập hiệu năng này cần quyền root để áp dụng vào `/etc/`:
```bash
# Copy cấu hình vào hệ thống
sudo cp -r ~/System-Configs/etc/* /etc/

# Áp dụng Split Lock Mitigation ngay lập tức
sudo sysctl -p /etc/sysctl.d/99-splitlock.conf

# Kích hoạt dịch vụ Scheduler chuyên game (scx_lavd)
sudo systemctl daemon-reload
sudo systemctl enable --now scx_lavd
```

### 4. Thiết lập Proton GE cho Game
- Mở `ProtonUp-QT` từ menu ứng dụng.
- Nhấn **Add version**, cài đặt bản **GE-Proton** mới nhất cho Steam.
- Trong Steam, chuột phải vào game -> Properties -> Launch Options, thêm:
  `game-performance %command%`

## 📋 Đặc điểm
- **Không dùng Symlink:** File cấu hình nằm ở đúng vị trí tự nhiên của nó (ví dụ `~/.config/nvim`).
- **Siêu nhẹ:** Không cần cài thêm bất kỳ trình quản lý dotfiles nào (Stow, Chezmoi, etc.), chỉ cần Git.
- **Dễ dàng sao lưu:** Toàn bộ lịch sử và cấu hình được đẩy lên GitHub.

## 🚀 Cách thức hoạt động
Sử dụng một repository "trần" (bare) tại `~/.dotfiles` và dùng một `alias` đặc biệt để điều khiển nó từ thư mục Home.

### Alias quản lý:
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

## 🛠️ Hướng dẫn sử dụng

### 1. Kiểm tra trạng thái
```bash
dotfiles status
```
*(Chỉ hiển thị các file đã được track nhờ cấu hình `status.showUntrackedFiles no`)*

### 2. Thêm file cấu hình mới
```bash
dotfiles add .config/app/config.conf
dotfiles commit -m "Add config for app"
```

### 3. Đẩy lên GitHub
```bash
dotfiles push
```

### 4. Cập nhật thay đổi từ GitHub
```bash
dotfiles pull
```

## 🔄 Cài đặt trên máy mới
```bash
# Clone repo về dưới dạng bare
git clone --bare git@github.com:Hinn27/dotfiles.git $HOME/.dotfiles

# Tạo alias tạm thời
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Checkout các file về thư mục Home
dotfiles checkout

# Nếu có lỗi trùng file, hãy backup file cũ rồi checkout lại
# Sau đó thiết lập để ẩn các file không liên quan
dotfiles config --local status.showUntrackedFiles no
```

## ⚡ Khôi phục cấu hình hệ thống (Optimization)
Một số file tối ưu hiệu năng nằm ở `/etc/` được lưu tạm tại `~/System-Configs/`. Để áp dụng lại trên máy mới:

```bash
# 1. Copy cấu hình vào hệ thống
sudo cp -r ~/System-Configs/etc/* /etc/

# 2. Áp dụng Split Lock Mitigation ngay lập tức
sudo sysctl -p /etc/sysctl.d/99-splitlock.conf

# 3. Kích hoạt dịch vụ Scheduler (scx_lavd)
sudo systemctl daemon-reload
sudo systemctl enable --now scx_lavd
```

## 📦 Danh sách các công cụ chính
- **Shell:** Zsh (với Starship prompt)
- **Editor:** Neovim (LazyVim base)
- **Terminal:** Kitty
- **WM:** Niri

---
*Ghi chú: Hệ thống này đã được chuyển đổi từ Nix/Home Manager vào ngày 31/05/2026.*
