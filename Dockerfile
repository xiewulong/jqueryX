FROM centos

MAINTAINER xiewulong <xiewulong@vip.qq.com>

RUN yum install -y http://mirrors.sohu.com/fedora-epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm && \
	yum update -y && \
	yum upgrade -y

RUN yum install -y nodejs && \
	yum clean all

RUN npm install -g grunt-cli && \
	useradd xiewulong && \
	su - xiewulong

ADD package.json

RUN npm install

WORKDIR /home/xiewulong

VOLUME ["/home/xiewulong"]

#CMD