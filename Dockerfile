FROM centos

MAINTAINER xiewulong <xiewulong@vip.qq.com>

RUN yum install -y http://mirrors.sohu.com/fedora-epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm && \
	yum update -y && \
	yum upgrade -y

RUN yum install -y tar bzip2 libpng libpng-devel nodejs npm && \
	yum clean all

RUN npm install -g grunt-cli && \
	useradd factory

USER factory

WORKDIR /home/factory/
RUN git clone https://github.com/xiewulong/jqueryX.git

WORKDIR jqueryX
RUN npm install