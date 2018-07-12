#!/bin/bash
 
mkdir -p /data
cd /data

# php env
#source ./install_php7.sh

# python env
## install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# python 语法检查flake8 
#@see https://gitlab.com/pycqa/flake8
#@see http://flake8.pycqa.org/en/latest/index.html#quickstart
python -m pip install flake8


# node js npm env

# install mysql client
yum -y install mysql


# 安装ctags

git clone https://github.com/universal-ctags/ctags.git
cd ctags/
./autogen.sh
#./configure --prefix=/where/you/want # defaults to /usr/local
./configure 
make
make install # may require extra privileges depending on where to install

# ctags --tag-relative=yes -R --fields=+aimlS --languages=php --PHP-kinds=+cdfint-av --exclude=composer.phar --exclude=*Test.php --exclude=*phpunit* --exclude="\.git"
cd ../



## install node npm

# 安装语法检查器

#jshint js语法检查
#@see http://jshint.com/install/

#cnpm install -g jshint
#ln -s /usr/local/node-v6.11.0-linux-x64/bin/jshint /usr/bin/jshint

# shell语法检查shellcheck需要先安装cabal
#yum install cabal-rpm.x86_64
#cd syntastic_checker/shellcheck/ShellCheck
#cabal install
#cd ../../../


# vim配置
# 配置vimrc,及安装相关vim插件[代码自动补全,语法检查,查找，目录树，代码注释，区域选择，多行编辑等],打造IDE开发环境
git clone https://github.com/icoolworld/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

#清理源文件
rm -rf /data/

