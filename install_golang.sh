#!/bin/bash
mkdir -p /data/ && cd /data/
wget https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz
tar zxf go1.13.1.linux-amd64.tar.gz
cp -r go/ /usr/local/
mkdir /root/go

#golang env
touch /etc/profile.d/golang.sh
echo "export GOROOT=/usr/local/go" >> /etc/profile.d/golang.sh
echo "export GOPATH=/root/go" >> /etc/profile.d/golang.sh
echo "export GO111MODULE=on" >> /etc/profile.d/golang.sh
#echo "export GOPROXY=https://mirrors.aliyun.com/goproxy/" >> /etc/profile.d/golang.sh
#echo "export GOPROXY=https://goproxy.cn" >> /etc/profile.d/golang.sh

echo 'export PATH=/usr/local/go/bin/:$PATH' >> /etc/profile
echo 'export PATH=/root/go/bin/:$PATH' >> /etc/profile
source /etc/profile
go env -w GOPROXY=https://goproxy.cn,direct

cd / && rm -rf /data/
