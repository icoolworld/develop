#!/bin/bash
mkdir -p /data/ && cd /data/

wget https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.xz
tar xf node-v10.16.3-linux-x64.tar.xz
cd node-v10.16.3-linux-x64/
\cp -r bin/ include/ lib/ share/ /usr/

#avaScript 代码规范，自带 linter & 代码自动修正
npm install --global standard
npm install --global prettier

cd / && rm -rf /data/
