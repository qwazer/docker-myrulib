FROM ubuntu:14.04

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 505A2DD1\
    && echo 'deb http://ppa.launchpad.net/lintest/myrulib/ubuntu trusty main' >> /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get -y install myrulib \
    && rm -rf /var/lib/apt/lists/*

CMD /usr/bin/myrulib
