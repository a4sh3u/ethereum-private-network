#!/bin/sh
set -e
export my_ip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
docker build -t epn/bootnode:latest ./bootnode/
docker run -itd --name bootnode -e my_ip=$my_ip -v $(pwd)/bootnode/boot.key:/root/boot.key -p 30301:30301 -p 30301:30301/udp \
epn/bootnode:latest --nodekey /root/boot.key --addr :30301 --nat extip:$my_ip

docker run -v /root/ethereum-private-network:/parity/config parity/parity:stable --config=/parity/config/config.toml
docker run -v /root/ethereum-private-network/client:/parity/config parity/parity:stable --config=/parity/config/config.toml
