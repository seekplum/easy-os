#!/bin/env bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${ROOT}

# 编译成汇编
nasm -o boot.bin boot.s

# 删除原文件
rm -f a.img a.img.lock

# fd模式创建虚拟磁盘映像
# bximage -mode=create -fd=1.44M -q a.img

# hd模式创建虚拟磁盘映像
bximage -q -mode=create -hd=10 -sectsize=512 -imgmode=flat a.img

# 并填充第一扇区
dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc

# 启动后输入 「c」
bochs -f bochs.properties -q
