FROM ubuntu:14.04

RUN apt-get -y update \
    && apt-get -y install software-properties-common python-software-properties \
    && add-apt-repository ppa:lintest/myrulib \
    && apt-get -y update \
    && apt-get -y install myrulib \
    && rm -rf /var/lib/apt/lists/*

CMD /usr/bin/myrulib
