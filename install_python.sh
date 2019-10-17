#!/bin/bash
mkdir -p /data/ && cd /data/

## install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# python 语法检查flake8
#@see https://gitlab.com/pycqa/flake8
#@see http://flake8.pycqa.org/en/latest/index.html#quickstart
pip install flake8

# code sytle
pip install --upgrade autopep8
pip install pycodestyle
pip install yapf
pip install futures

cd / && rm -rf /data/
