# Dotfiles Management - Git Bare Repository

Hệ thống quản lý cấu hình cá nhân tối giản sử dụng phương pháp **Git Bare Repository**.

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

## 📦 Danh sách các công cụ chính
- **Shell:** Zsh (với Starship prompt)
- **Editor:** Neovim (LazyVim base)
- **Terminal:** Kitty
- **WM:** Niri

---
*Ghi chú: Hệ thống này đã được chuyển đổi từ Nix/Home Manager vào ngày 31/05/2026.*
