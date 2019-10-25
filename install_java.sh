#!/bin/bash
mkdir -p /data/ && cd /data/

yum -y install java-latest-openjdk
yum -y install java-latest-openjdk-devel

cd / && rm -rf /data/
