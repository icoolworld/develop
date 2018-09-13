#!/bin/bash

#进入源码目录
mkdir -p /data/
cd /data/

# centos初始化一些环境，安装一些基础的类库等
yum -y install wget curl tar zip unzip xz make gcc git perl perl-ExtUtils-Embed ruby pcre-devel openssl openssl-devel subversion deltarpm python-devel;
yum -y install libtool automake autoconf install gcc-c++;
yum -y install libxml2-devel zlib-devel bzip2 bzip2-devel;
yum -y install ncurses-devel readline-devel;
yum -y remove vim vim-enhanced vim-common vim-minimal vim-filesystem;

#timezone set
rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#localedef tools,languages
#yum -y install kde-l10n-Chinese && yum -y reinstall glibc-common
yum -y reinstall glibc glibc-common

#default language set
echo LANG="en_US.UTF-8" >> /etc/sysconfig/i18n
#localedef -c -f UTF-8 -i zh_CN zh_CN.utf
#export LC_ALL zh_CN.utf8
#localedef -c -f UTF-8 -i en_US en_US.utf8
#export LC_ALL en_US.utf8

#安装lua
curl -R -O http://www.lua.org/ftp/lua-5.3.4.tar.gz
tar zxf lua-5.3.4.tar.gz
cd lua-5.3.4
make linux test
make -j 8 install INSTALL_TOP=/usr/local/lua5.3.4

mv /usr/bin/lua /usr/bin/lua5.1
mv /usr/bin/luac /usr/bin/luac5.1

ln -s /usr/local/lua5.3.4/bin/lua /usr/bin/lua
ln -s /usr/local/lua5.3.4/bin/luac /usr/bin/luac

#安装luajit
cd ../
curl -R -O http://luajit.org/download/LuaJIT-2.0.5.tar.gz
tar zxf LuaJIT-2.0.5.tar.gz
cd LuaJIT-2.0.5
make -j 8 && make install PREFIX=/usr/local/luajit2.0.5


cd ../
git clone https://github.com/vim/vim.git
cd vim/src/
./configure --prefix=/usr/local/vim8 --with-features=huge --enable-cscope --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib64/python2.7/config --enable-luainterp  --with-lua-prefix=/usr/local/lua5.3.4 --enable-perlinterp --enable-largefile --enable-multibyte --disable-netbeans --enable-cscope >> logs
make && make install

ln -s /usr/local/vim8/bin/vim /usr/bin/vim
ln -s /usr/bin/vim /usr/bin/vi

echo "export TERM=xterm-256color" >> /etc/bashrc
echo "export LANG=en_US.UTF-8" >> /etc/bashrc


#./configure --prefix=/usr/local/vim8 \
#--with-features=huge \
#--enable-cscope \
#--enable-rubyinterp \
#--enable-pythoninterp \
#--with-python-config-dir=/usr/local/python2.7.13/lib/python2.7/config \
#--enable-luainterp \
#--with-lua-prefix=/usr/local/lua5.3.4 \
#--enable-perlinterp \
#--enable-largefile \
#--enable-multibyte \
#--disable-netbeans \
#--enable-cscope ;\
#

## install develope tools
#yum group install "Development Tools"

# ag..
yum -y install epel-release.noarch
yum -y install the_silver_searcher

# ack
yum -y install ack

yum -y install nc
yum -y install lsof
yum -y install strace ltrace
# install dig
yum -y install bind-utils
yum -y install gdb
# install sar
yum -y install sysstat && sar -o 2 3
yum -y install telnet
# netstat
yum -y install net-tools

# install sshd service
yum install -y openssh-server
systemctl start sshd
systemctl enable sshd     
echo root:123456|chpasswd

# fix git status chinese path unreadable
git config --global core.quotepath false

# autojump command
git clone git://github.com/wting/autojump.git
cd autojump
./install.py
echo "[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh" >> /etc/bashrc
cd ../
rm -rf autojump

# fix sshd server
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ""
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ""
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""

# install docker
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce

cd / && rm -rf /data
