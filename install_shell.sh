#!/bin/bash
mkdir -p /data/ && cd /data/

yum -y install ShellCheck

cd / && rm -rf /data/
