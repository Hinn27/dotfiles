# Hinn's Dotfiles

Repository quản lý cấu hình cá nhân dạng Git Bare. Tối ưu cho CachyOS và NVIDIA.

## Hướng dẫn cài đặt

### 1. Cài đặt các gói cốt lõi
```bash
sudo pacman -Syu
sudo pacman -S --needed base-devel git zoxide fzf starship zsh fastfetch kitty neovim niri noctalia-git mpv
```

### 2. Thiết lập Dotfiles
```bash
# Clone repo dưới dạng bare
git clone --bare git@github.com:Hinn27/dotfiles.git $HOME/.dotfiles

# Tạo alias tạm thời
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Checkout cấu hình và ẩn các file không theo dõi
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

### 3. Cấu hình hệ thống (yêu cầu quyền root)
```bash
# Sao chép cấu hình hệ thống
sudo cp -r ~/System-Configs/etc/* /etc/

# Áp dụng cấu hình Split Lock Mitigation (cho CPU Intel)
sudo sysctl -p /etc/sysctl.d/99-splitlock.conf

# Kích hoạt Scheduler scx_lavd cho game
sudo systemctl daemon-reload
sudo systemctl enable --now scx_lavd
```

## Tối ưu hóa Gaming
- Mở **CachyOS Hello**, vào mục **Apps** và cài đặt **Gaming Packages**.
- Cài đặt `protonup-qt` để tải phiên bản **GE-Proton** mới nhất cho Steam.
- Thêm `game-performance %command%` vào Launch Options của game trên Steam.

## Các ứng dụng chính
- **Window Manager:** Niri
- **Desktop Shell:** Noctalia
- **Editor:** Neovim
- **Terminal:** Kitty
- **Shell:** Zsh (Starship + Zoxide + Fzf)

## Quản lý Dotfiles
Sử dụng alias `dotfiles` (đã có sẵn trong cấu hình `.zshrc`):
- `dotfiles status` : Kiểm tra trạng thái thay đổi
- `dotfiles add <file>` : Thêm file vào quản lý
- `dotfiles commit -m "message"` : Lưu thay đổi
- `dotfiles push` : Đẩy lên repo remote
