#!/bin/bash

mkdir -p /data
cd /data
source /etc/profile

# vim
git clone --depth=1 https://github.com/icoolworld/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
sh ~/.vim_runtime/install_custom_vimrc.sh

cd / && rm -rf /data/
