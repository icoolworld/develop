#!/bin/bash
mkdir -p /data/ && cd /data/
wget https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz
tar zxf go1.13.1.linux-amd64.tar.gz
cp go/bin/* /usr/bin/
cd / && rm -rf /data/
