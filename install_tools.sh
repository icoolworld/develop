#!/bin/bash
mkdir -p /data/ && cd /data/

# install mysql client
yum -y install mysql

# redis
yum -y install redis

# pgsql
yum -y install pspg

# another mysql client
pip install -U mycli

# another pgsql client
pip install -U pgcli

cd / && rm -rf /data/
