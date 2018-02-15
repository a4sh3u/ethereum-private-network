#!/bin/sh
set -e

# Parity Node 1
parity account new --chain chain-spec.json --keys-path ./keys
export password=12345
echo $password > .parity-pass
export address=0x958e11d4dbb94bd81103bfdeb3d39b952c28b6ee
parity --chain chain-spec.json --author ${address} --unlock ${address} --password .parity-pass --base-path=. \
--force-ui --rpccorsdomain "*" --jsonrpc-interface all --jsonrpc-hosts all >&1 1>>parity.log 2>&1 &


# Parity Node 2
parity --chain chain-spec.json --base-path=. --force-ui --rpccorsdomain "*" --jsonrpc-interface all --jsonrpc-hosts all \
--bootnodes enode://181dd3dd6be3fbb801a0bb1221ce586083bd29ca399bfc0403bca3fdfc59bbb7361de657f3799b28c0d0edf89213172d3444f5ad161eedbedc664201d6dba3d8@192.168.178.132:30303 >&1 1>>parity.log 2>&1 &


# Parity Node 3
parity --chain chain-spec.json
