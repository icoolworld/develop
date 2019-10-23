FROM centos:7
MAINTAINER coolbaby
ADD . /build/
WORKDIR /build/
ENV SHELL /bin/bash
RUN chmod a+x /build/*.sh
RUN /build/install_centos_base.sh
RUN /build/install_shell.sh
RUN /build/install_php7.sh
RUN /build/install_golang.sh
RUN /build/install_node.sh
RUN /build/install_python.sh
RUN /build/install_tools.sh
RUN /build/install_vim.sh
RUN /build/install_ide.sh
RUN /build/install_zsh.sh
RUN /build/clear.sh
WORKDIR /

