FROM ubuntu:18.04

RUN apt update && apt-get install -y ser2net && apt-get install -y ttylog