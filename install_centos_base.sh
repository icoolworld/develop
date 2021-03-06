#!/bin/bash

mkdir -p /data/ && cd /data/


yum -y install wget

yum -y install epel-release
#yum update
yum -y install bash zsh

# centos初始化一些环境，安装一些基础的类库等
yum -y install curl tar zip unzip xz make gcc git perl perl-ExtUtils-Embed ruby ruby-devel pcre-devel openssl openssl-devel subversion deltarpm python-devel;
yum -y install libtool automake autoconf gcc-c++;
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


## install develope tools
yum group install -y "Development Tools"

# ag..
yum -y install the_silver_searcher

# ack
yum -y install ack

# install nc
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
cd /data/
git clone https://github.com/wting/autojump.git
cd autojump && ./install.py
echo "[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh" >> ~/.bashrc
cd ../ && rm -rf autojump

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

curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose

yum install -y tree
yum -y install iotop
yum -y install iftop
yum -y install which
yum -y install bash-completion

# git autocomplete
cat <<EOT >>  ~/.bashrc
for file in /etc/bash_completion.d/* ; do
    source "\$file"
done
EOT

cat <<EOT >>  ~/.gitconfig
[alias]
   # Shortening aliases
   co = checkout
   cob = checkout -b
   f = fetch -p
   c = commit
   p = push
   br = branch -r
   ba = branch -a
   bd = branch -d
   bD = branch -D
   dc = diff --cached

   # Feature improving aliases
   #st = status -sb
   st = status
   a = add -A

   # Complex aliases
   plog = log --graph --pretty='format:%C(red)%d%C(reset) %C(yellow)%h%C(reset) %ar %C(green)%aN%C(reset) %s'
   tlog = log --stat --since='1 Day Ago' --graph --pretty=oneline --abbrev-commit --date=relative
   lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
   rank = shortlog -sn --no-merges
   bdm = "!git branch --merged | grep -v '*' | xargs -n 1 git branch -d"
EOT

yum install -y dnf

# install fd
cd /data
wget https://github.com/sharkdp/fd/releases/download/v7.4.0/fd-v7.4.0-x86_64-unknown-linux-musl.tar.gz -O fd.tar.gz
tar zxf fd.tar.gz
cd fd-v7.4.0-x86_64-unknown-linux-musl/
cp ./fd /usr/bin/
cp ./fd.1 /usr/share/man/man1/

yum -y install httpie

yum -y install fortune-mod

yum -y install ctags

# install Powerline fonts
cd /data
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh

touch /etc/profile.d/fix.sh
# git log 乱码问题
echo "export LESSCHARSET=utf-8" >> /etc/profile.d/fix.sh
echo "export TERM=xterm-256color" >> /etc/profile.d/fix.sh
echo "export LANG=en_US.UTF-8" >> /etc/profile.d/fix.sh

cd / && rm -rf /data/
