FROM centos:latest
MAINTAINER coolbaby
ADD . /build/
WORKDIR /build/
ENV SHELL /bin/bash
RUN chmod a+x /build/*.sh
RUN /build/install_centos_base.sh
RUN /build/install_php7.sh
RUN /build/install_ide.sh
RUN /build/install_zsh.sh
RUN /build/clear.sh
WORKDIR /

