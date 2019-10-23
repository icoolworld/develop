#!/bin/bash

mkdir -p /data/ && cd /data/

git clone https://github.com/vim/vim.git
cd vim/src/
./configure --prefix=/usr/local/vim8 --with-features=huge --enable-cscope --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib64/python2.7/config --enable-luainterp  --with-lua-prefix=/usr/local/lua5.3.4 --enable-perlinterp --enable-largefile --enable-multibyte --disable-netbeans --enable-cscope >> logs
make && make install

ln -s /usr/local/vim8/bin/vim /usr/bin/vim
ln -s /usr/bin/vim /usr/bin/vi

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

cd / && rm -rf /data/
