FROM ubuntu:18.04

RUN apt update && apt-get install -y telnet ser2net python3 python3-pip
COPY ./crash-logs-docker/slsnif-0-4-4.deb /opt/
RUN dpkg -i /opt/slsnif-0-4-4.deb
RUN pip3 install pexpect flask