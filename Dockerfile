FROM ubuntu:18.04

RUN apt update && apt-get install -y openssh-server && apt-get install -y telnet 
RUN apt-get install -y minicom
