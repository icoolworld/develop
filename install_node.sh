#!/bin/bash
mkdir -p /data/ && cd /data/

#curl -sL install-node.now.sh/lts | bash

wget https://nodejs.org/dist/v18.15.0/node-v18.15.0-linux-x64.tar.xz
tar xf node-v18.15.0-linux-x64.tar.xz
cd node-v18.15.0-linux-x64/
\cp -r bin/ include/ lib/ share/ /usr/

node -v
npm -v

# install yarn
corepack enable

#curl -o- -L https://yarnpkg.com/install.sh | bash
#echo 'export PATH=/root/.yarn/bin/:$PATH' >> /etc/profile

cd / && rm -rf /data/
