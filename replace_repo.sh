#!/bin/sh

mkdir -p /data
cd /data
source /etc/profile

# replace repo to aliyun
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
yum clean all
#yum makecache

# replace repo
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
npm --registry https://registry.npm.taobao.org info underscore
go env -w GOPROXY=https://goproxy.cn,direct

cd / && rm -rf /data
