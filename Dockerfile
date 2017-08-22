FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install build-essential
RUN apt-get -y install wget

RUN mkdir /BlockDX
RUN git clone https://github.com/BlocknetDX/BlockDX.git /BlockDX

RUN apt-get -y install build-essential libtool autotools-dev autoconf pkg-config libssl-dev
RUN apt-get -y install libboost-all-dev
RUN apt-get -y install software-properties-common

RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get -y install libdb4.8-dev libdb4.8++-dev

RUN apt-get -y install libminiupnpc-dev


