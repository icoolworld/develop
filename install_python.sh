#!/bin/bash
mkdir -p /data/ && cd /data/

## install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# python 语法检查flake8
#@see https://gitlab.com/pycqa/flake8
#@see http://flake8.pycqa.org/en/latest/index.html#quickstart
pip install flake8
pip install pylint

# code sytle
pip install --upgrade autopep8
pip install pycodestyle
pip install yapf
pip install futures

# install python3
yum -y install python36
yum -y install python3-devel

#yum -y install centos-release-scl
#yum install rh-python36
#scl enable rh-python36 bash
#ln -s /opt/rh/rh-python36/root/usr/bin/python /usr/bin/python3

cd / && rm -rf /data/
