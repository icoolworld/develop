#!/bin/bash
mkdir -p /data/ && cd /data/

yum -y install java-latest-openjdk
yum -y install java-latest-openjdk-devel

touch /etc/profile.d/java.sh
echo "export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8" >> /etc/profile.d/java.sh
echo "export JAVA_HOME=/usr/" >> /etc/profile.d/java.sh

cd / && rm -rf /data/
