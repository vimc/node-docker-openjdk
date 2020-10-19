FROM vimc/node-docker:master

RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/stretch-backports.list
RUN apt-get update
RUN apt-get install -t stretch-backports -y \
    openjdk-8-jdk
RUN rm /etc/apt/sources.list.d/stretch-backports.list
