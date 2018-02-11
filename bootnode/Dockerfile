FROM ubuntu:latest

RUN apt update -y && \
    apt install software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt update -y && \
    apt install bootnode -y && \
    apt remove --purge software-properties-common -y && \
    apt autoremove -y

ENTRYPOINT ["/usr/bin/bootnode"]
