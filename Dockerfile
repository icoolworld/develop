FROM centos:latest
MAINTAINER coolbaby
ADD . /data/
WORKDIR /data/
RUN chmod a+x /data/*.sh
RUN /data/install_centos_base.sh
RUN /data/install_php7.sh
RUN /data/install_ide.sh
WORKDIR /

