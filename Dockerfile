FROM centos

MAINTAINER xiewulong <xiewulong@vip.qq.com>

RUN yum install -y http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm && \
	yum update -y && \
	yum upgrade -y

RUN yum install -y tar bzip2 libpng libpng-devel git-core nodejs npm && \
	yum clean all

RUN npm install -g grunt-cli

USER root

WORKDIR /root
RUN git clone https://github.com/xiewulong/jqueryX.git

WORKDIR jqueryX
RUN npm install

ENTRYPOINT su - root