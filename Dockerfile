FROM ubuntu

RUN apt update && apt-get install -y telnet python3 python3-pip
RUN pip3 install pexpect