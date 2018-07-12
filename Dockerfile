FROM centos:latest
MAINTAINER coolbaby
ADD . /build/
WORKDIR /build/
RUN chmod a+x /build/*.sh
RUN /build/install_centos_base.sh
RUN /build/install_php7.sh
RUN /build/install_ide.sh
WORKDIR /

