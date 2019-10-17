#!/bin/bash
mkdir -p /data
cd /data/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
\cp /build/.zshrc ~/.zshrc
source ~/.zshrc
