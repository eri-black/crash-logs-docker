FROM ubuntu:18.04

RUN apt update && apt-get install -y openssh-server 
RUN apt-get install -y ttylog