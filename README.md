## Parity PoW Private Chain - Tried only on Ubuntu Nodes

### 1. Install Parity on all the nodes  
    bash <(curl https://get.parity.io -kL)

### 2. Node 1 - Create a new account, which would become the initial account to get a lot of ethers. Choose the password, store it in a local file and note the account id
    parity account new --chain chain-spec.json --keys-path ./keys
    export password=12345
    echo $password > .parity-pass
    export address=0x958e11d4dbb94bd81103bfdeb3d39b952c28b6ee

### 3. Replace the account in chain-spec.json file with the account generated in the above step (Line 34)
    "0x958e11d4dbb94bd81103bfdeb3d39b952c28b6ee": { "balance": "1000000000"}

### 4. Start Parity on Node 1
    parity --chain chain-spec.json --author ${address} --unlock ${address} --password .parity-pass --base-path=. \
    --force-ui --rpccorsdomain "*" --jsonrpc-interface all --jsonrpc-hosts all

### 5. Start Parity on Node 2 (Install Parity on this node as shown in Step 1) - With the enode of Node 1
    parity --chain chain-spec.json --base-path=. --force-ui --rpccorsdomain "*" --jsonrpc-interface all --jsonrpc-hosts all \
    --bootnodes enode://181dd3dd6be3fbb801a0bb1221ce586083bd29ca399bfc0403bca3fdfc59bbb7361de657f3799b28c0d0edf89213172d3444f5ad161eedbedc664201d6dba3d8@192.168.178.132:30303

### 6. Start Parity on Node 3 (Install Parity on this node as shown in Step 1) - With just the chain-spec
    parity --chain chain-spec.json
