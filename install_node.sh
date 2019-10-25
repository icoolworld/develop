#!/bin/bash
mkdir -p /data/ && cd /data/

#curl -sL install-node.now.sh/lts | bash

wget https://nodejs.org/dist/v12.13.0/node-v12.13.0-linux-x64.tar.xz
tar xf node-v12.13.0-linux-x64.tar.xz
cd node-v12.13.0-linux-x64/
\cp -r bin/ include/ lib/ share/ /usr/

node -v
npm -v

#avaScript 代码规范，自带 linter & 代码自动修正
npm install --global standard
npm install --global prettier
npm install --global eslint

# install yarn
curl -o- -L https://yarnpkg.com/install.sh | bash
echo 'export PATH=/root/.yarn/bin/:$PATH' >> /etc/profile

cd / && rm -rf /data/
