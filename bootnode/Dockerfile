FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update -y && \
    apt-get install bootnode -y && \
    apt-get remove --purge software-properties-common -y && \
    apt-get autoremove -y

ENTRYPOINT ["/usr/bin/bootnode"]
