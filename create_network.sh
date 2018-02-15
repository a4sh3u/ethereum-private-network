#!/bin/sh
set -e
# Bootnode
bootnode -nodekey boot.key -nat extip:192.168.178.47 -verbosity 9

# Parity Node 1
export password=12345
export address=0xbc6c11b0d2db2bce3c52a97fbd28b342ae6bc0ae
parity --chain chain-spec.json --author ${address} --unlock ${address} --password .parity-pass --base-path=. \
--force-ui --rpccorsdomain "*" --jsonrpc-interface all --jsonrpc-hosts all >&1 1>>parity.log 2>&1 &



parity --chain chain-spec.json --base-path=. --force-ui --rpccorsdomain "*" --jsonrpc-interface all --jsonrpc-hosts all \
--bootnodes enode://a94c2edb40d6e4fcb017a32498c65387f0b6f2f5b4d603648747f9748d9e0663d4d688d2394e9c1ae6aa1bece6a7eb57c256e20f5e1b030aae4e03b4bf424883@192.168.178.132:30303 >&1 1>>parity.log 2>&1 &
