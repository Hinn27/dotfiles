#!/bin/bash
# Script to fix DAMX by rebuilding the linuwu_sense module
# Created by Gemini CLI

echo -e "\e[34m[DAMX Fix]\e[0m Starting DAMX driver rebuild..."

# Directory path
LINUWU_SENSE_DIR="/home/hinne/damx-debug/DAMX-0.9.1/Linuwu-Sense"

if [ ! -d "$LINUWU_SENSE_DIR" ]; then
    echo -e "\e[31m[Error]\e[0m Directory $LINUWU_SENSE_DIR not found!"
    exit 1
fi

cd "$LINUWU_SENSE_DIR"

# Rebuild with clang/LLVM (CachyOS default)
echo -e "\e[34m[DAMX Fix]\e[0m Cleaning and rebuilding module..."
make clean > /dev/null 2>&1
make LLVM=1 CC=clang HOSTCC=clang

if [ $? -eq 0 ]; then
    echo -e "\e[34m[DAMX Fix]\e[0m Installing module..."
    sudo make install LLVM=1 CC=clang HOSTCC=clang
    
    echo -e "\e[34m[DAMX Fix]\e[0m Restarting DAMX-Daemon..."
    sudo systemctl restart damx-daemon.service
    
    echo -e "\e[32m[Success]\e[0m DAMX drivers have been updated and service restarted."
else
    echo -e "\e[31m[Error]\e[0m Failed to build the module. Please check logs."
    exit 1
fi
