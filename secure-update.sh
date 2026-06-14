#!/bin/bash
# Script cập nhật hệ thống an toàn - Heuristic Security Scanner
# Tạo bởi Gemini CLI cho người dùng hinne

echo "--- [1/3] Đang quét Heuristic An ninh trên AUR Cache ---"

# 1. Quét các IOC đã biết (Atomic Arch)
IOC_KNOWN=$(grep -rE "atomic-lockfile|js-digest|arch-audit-fix" ~/.cache/yay ~/.cache/paru 2>/dev/null)

# 2. Quét hành vi: Pipe curl/wget vào shell (Downloader nguy hiểm)
IOC_DOWNLOADER=$(grep -rE "(curl|wget).*\|.*(bash|sh|python|node|perl)" ~/.cache/yay ~/.cache/paru 2>/dev/null)

# 3. Quét hành vi: Obfuscation (Base64 hoặc Hex cực dài trong PKGBUILD)
IOC_OBFUSCATION=$(grep -rE "[a-zA-Z0-9+/]{100,}" ~/.cache/yay ~/.cache/paru 2>/dev/null | grep "PKGBUILD" | grep -vE "(sums|sha[0-9]*|b2|md5)" | grep -vE "['\"][a-f0-9]{64,}['\"]")

# 4. Quét hành vi: Tự ý cài systemd/cron lén lút
IOC_PERSISTENCE=$(grep -rE "cp.*(/etc/systemd|/var/spool/cron|/etc/init.d)" ~/.cache/yay ~/.cache/paru 2>/dev/null)

if [ -n "$IOC_KNOWN" ] || [ -n "$IOC_DOWNLOADER" ] || [ -n "$IOC_OBFUSCATION" ] || [ -n "$IOC_PERSISTENCE" ]; then
    echo "⚠️ CẢNH BÁO: Phát hiện dấu hiệu bất thường trong AUR Cache!"
    [ -n "$IOC_KNOWN" ] && echo "- Tìm thấy mã độc đã biết."
    [ -n "$IOC_DOWNLOADER" ] && echo "- Tìm thấy script tải file thực thi trực tiếp (Dangerous Downloader)."
    [ -n "$IOC_OBFUSCATION" ] && echo "- Tìm thấy mã nguồn bị mã hóa/ngụy trang (Obfuscation)."
    [ -n "$IOC_PERSISTENCE" ] && echo "- Tìm thấy nỗ lực cài đặt file hệ thống trái phép."
    echo "Vui lòng kiểm tra kỹ các file PKGBUILD trước khi tiếp tục."
    exit 1
fi

echo "--- [2/3] Bắt đầu cập nhật hệ thống ---"
paru -Syu

echo "--- [3/3] Đang thực hiện dọn dẹp & fix lỗi ---"
[ -x /usr/bin/flatpak ] && flatpak update -y
[ -f "/home/hinne/fix-damx.sh" ] && /home/hinne/fix-damx.sh

# Dọn dẹp cache để đảm bảo lần sau luôn pull source mới nhất
echo "Đang làm sạch cache để bảo mật..."
rm -rf ~/.cache/paru/clone/*
rm -rf ~/.cache/yay/*

echo "✅ Hệ thống đã được cập nhật an toàn."
