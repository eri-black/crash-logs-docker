FROM ubuntu

RUN apt update && apt-get install -y telnet ser2net
