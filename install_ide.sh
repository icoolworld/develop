#!/bin/bash

mkdir -p /data
cd /data
source /etc/profile

# 安装ctags

#git clone https://github.com/universal-ctags/ctags.git
#cd ctags/
#./autogen.sh
#./configure --prefix=/where/you/want # defaults to /usr/local
#./configure
#make
#make install # may require extra privileges depending on where to install

# ctags --tag-relative=yes -R -f /dev/shm/ctags --fields=+aimlS --languages=php --PHP-kinds=+cdfint-av --exclude=composer.phar --exclude=*Test.php --exclude=*phpunit* --exclude="\.git"
# phpctags --memory=1G  -R
#cd ../


# vim配置
# 配置vimrc,及安装相关vim插件[代码自动补全,语法检查,查找，目录树，代码注释，区域选择，多行编辑等],打造IDE开发环境
git clone https://github.com/icoolworld/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# vim-go init
vim -c ":GoInstallBinaries"
go env -w GOPROXY=https://goproxy.cn,direct

cd / && rm -rf /data/
