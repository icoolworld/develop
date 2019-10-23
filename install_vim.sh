#!/bin/bash

mkdir -p /data/ && cd /data/

git clone --depth=1 https://github.com/vim/vim.git
cd vim/src/

#--with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu \
#--with-python-config-dir=/usr/lib64/python2.7/config \

./configure --prefix=/usr/local/vim8 \
--with-features=huge \
--enable-cscope \
--enable-rubyinterp=dynamic \
--with-ruby-command=/usr/bin/ruby \
--enable-pythoninterp \
--enable-python3interp=yes \
--enable-luainterp \
--with-lua-prefix=/usr/local/lua5.3.4 \
--enable-perlinterp \
--enable-largefile \
--enable-multibyte \
--disable-netbeans \
--enable-cscope \
--enable-fail-if-missing

make && make install

ln -s /usr/local/vim8/bin/vim /usr/bin/vim
ln -s /usr/bin/vim /usr/bin/vi

cd / && rm -rf /data/
