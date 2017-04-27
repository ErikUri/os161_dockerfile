FROM ubuntu:latest
MAINTAINER Erik Kristian Sverre Uri <eksu@fastmail.com>


ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -qq update
RUN apt-get -qq -y install software-properties-common git gcc
RUN add-apt-repository ppa:ops-class/os161-toolchain
RUN apt-get -qq update
RUN apt-get -qq install -y os161-toolchain


RUN git clone https://github.com/ErikUri/os161.git /root/os161/src

WORKDIR "/root/os161/src/kern/conf"
RUN ./config ASST1

WORKDIR "/root/os161/src/kern/compile/ASST1"
RUN bmake depend
RUN bmake
RUN bmake install

WORKDIR "/root/os161/src/"
RUN bmake
RUN cp /usr/share/examples/sys161/sys161.conf.sample /root/os161/root/sys161.conf


ENTRYPOINT bash
