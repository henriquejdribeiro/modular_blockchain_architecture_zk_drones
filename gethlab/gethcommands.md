...

# L1 commands on ~/blockchain-l1/

# Stop the host Geth
pkill geth

# Make sure it's stopped
ps aux | grep geth

#port clean
sudo lsof -i :8545

#kill process
sudo kill -9 PID

# Initialize with genesis (this creates a brand new chain)
sudo docker compose down --remove-orphans
sudo rm -rf ./data/geth
echo "" > geth_output.log
sudo docker compose pull
sudo docker compose run --rm geth --datadir /root/.ethereum init /root/genesis.json
sudo docker compose up -d
sudo docker compose logs -f geth

OR

#delete data start chain again
rm -rf ./data/geth
geth --datadir ./data init genesis.json
./start-node.sh
#output chain
tail -f geth_output.log


# Deploy contracts on L1 on ~/starknet-core-contracts$
npx hardhat run scripts/deployCore.js --network localhost

Deploying contracts with account: 0x957A41bA4E0CD7Dd1225D26f8c38a1a9Df373c8E
Account balance: 100000000000000000000
Deploying StarknetCore...
StarknetCore deployed to: 0x233c2D209c8264b348e6FC64f53D41e1f026c77F
Transaction hash: 0x22b0c726865128c32fabcba4e31e1703de294940783a2e250cc221e3e03985b1
Deploying L1Messaging...
L1Messaging deployed to: 0x8cc82CE99dF03ac918daFA5FDCDBAf93a13721D8
Transaction hash: 0x1a094160eb3458387a46ec7c08b67daf8567543d41d72d80ab687f35fd7da419



## NODE 1
henryjr@henryjr:~/tese/gethlab$ docker run --rm \
  -v $(pwd)/data/node1:/data \
  -v $(pwd)/passwords/node1.txt:/password.txt \
  ethereum/client-go:v1.10.17 account new --datadir /data --password /password.txt
INFO [12-24|03:15:08.627] Maximum peer count                       ETH=50 LES=0 total=50
INFO [12-24|03:15:08.628] Smartcard socket not found, disabling    err="stat /run/pcscd/pcscd.comm: no such file or directory"

Your new key was generated

Public address of the key:   0x1e86B39f3d3d34caA465604E1Df569072c115Ec5
Path of the secret key file: /data/keystore/UTC--2025-12-24T03-15-08.628206052Z--1e86b39f3d3d34caa465604e1df569072c115ec5

- You can share your public address with anyone. Others need it to interact with you.
- You must NEVER share the secret key with anyone! The key controls access to your funds!
- You must BACKUP your key file! Without the key, it's impossible to access account funds!
- You must REMEMBER your password! Without the password, it's impossible to decrypt the key!

## NODE 2

henryjr@henryjr:~/tese/gethlab$ docker run --rm   -v $(pwd)/data/node2:/data   -v $(pwd)/passwords/node2.txt:/password.txt   ethereum/client-go:v1.10.17 account new --datadir /data --p
assword /password.txt
INFO [12-24|03:15:40.937] Maximum peer count                       ETH=50 LES=0 total=50
INFO [12-24|03:15:40.937] Smartcard socket not found, disabling    err="stat /run/pcscd/pcscd.comm: no such file or directory"

Your new key was generated

Public address of the key:   0x717F7bB0967387705ccE24546C709193252C6030
Path of the secret key file: /data/keystore/UTC--2025-12-24T03-15-40.937283487Z--717f7bb0967387705cce24546c709193252c6030

- You can share your public address with anyone. Others need it to interact with you.
- You must NEVER share the secret key with anyone! The key controls access to your funds!
- You must BACKUP your key file! Without the key, it's impossible to access account funds!
- You must REMEMBER your password! Without the password, it's impossible to decrypt the key!

## NODE 3

henryjr@henryjr:~/tese/gethlab$ docker run --rm   -v $(pwd)/data/node3:/data   -v $(pwd)/passwords/node3.txt:/password.txt   ethereum/client-go:v1.10.17 account new --datadir /data --p
assword /password.txt
INFO [12-24|03:16:04.174] Maximum peer count                       ETH=50 LES=0 total=50
INFO [12-24|03:16:04.174] Smartcard socket not found, disabling    err="stat /run/pcscd/pcscd.comm: no such file or directory"

Your new key was generated

Public address of the key:   0xFA7fc32f9c75477f515d0f15076EDeD99749a939
Path of the secret key file: /data/keystore/UTC--2025-12-24T03-16-04.174466685Z--fa7fc32f9c75477f515d0f15076eded99749a939

- You can share your public address with anyone. Others need it to interact with you.
- You must NEVER share the secret key with anyone! The key controls access to your funds!
- You must BACKUP your key file! Without the key, it's impossible to access account funds!
- You must REMEMBER your password! Without the password, it's impossible to decrypt the key!








henryjr@henryjr:~/tese/gethlab$ docker exec -it geth-node1 geth attach /data/geth.ipc
Welcome to the Geth JavaScript console!

instance: Geth/v1.16.7-stable-b9f3a3d9/linux-amd64/go1.24.9
at block: 0 (Thu Jan 01 1970 00:00:00 GMT+0000 (UTC))
 datadir: /data
 modules: admin:1.0 debug:1.0 engine:1.0 eth:1.0 miner:1.0 net:1.0 rpc:1.0 txpool:1.0 web3:1.0

To exit, press ctrl-d or type exit
> admin.nodeInfo.enode
"enode://c8a1ec4ab302e7ed317d10211e350ad514326d15bb341fb29650991c12e16bf3a6ee3c66b37767bbe08425bc922d543aedd8f047065bfed905899c84a4f4a4a9@127.0.0.1:30303"

add on docker compose node 2 and 3 the line:
--bootnodes enode://c8a1ec4ab302e7ed317d10211e350ad514326d15bb341fb29650991c12e16bf3a6ee3c66b37767bbe08425bc922d543aedd8f047065bfed905899c84a4f4a4a9@node1:30303












## RUN NODE 1

henryjr@henryjr:~/tese/gethlab$ docker run --rm \
  -v $(pwd)/genesis.json:/genesis.json \
  -v $(pwd)/data/node1:/root/.ethereum \
  ethereum/client-go init /genesis.json
INFO [12-24|02:13:51.197] Maximum peer count                       ETH=50 total=50
INFO [12-24|02:13:51.198] Smartcard socket not found, disabling    err="stat /run/pcscd/pcscd.comm: no such file or directory"
INFO [12-24|02:13:51.199] Set global gas cap                       cap=50,000,000
INFO [12-24|02:13:51.200] Initializing the KZG library             backend=gokzg
INFO [12-24|02:13:51.201] Defaulting to pebble as the backing database
INFO [12-24|02:13:51.201] Allocated cache and file handles         database=/root/.ethereum/geth/chaindata cache=512.00MiB handles=524,288
INFO [12-24|02:13:51.272] Opened ancient database                  database=/root/.ethereum/geth/chaindata/ancient/chain readonly=false
INFO [12-24|02:13:51.272] Opened Era store                         datadir=/root/.ethereum/geth/chaindata/ancient/chain/era
WARN [12-24|02:13:51.273] Head block is not reachable
INFO [12-24|02:13:51.273] State schema set to default              scheme=path
INFO [12-24|02:13:51.273] Load database journal from disk
INFO [12-24|02:13:51.321] Opened ancient database                  database=/root/.ethereum/geth/chaindata/ancient/state readonly=false
INFO [12-24|02:13:51.321] State snapshot generator is not found
INFO [12-24|02:13:51.321] Starting snapshot generation             root=56e81f..63b421 accounts=0 slots=0 storage=0.00B dangling=0 elapsed="24.457µs"
INFO [12-24|02:13:51.322] Initialized path database                triecache=16.00MiB statecache=16.00MiB buffer=64.00MiB state-history="last 90000 blocks" journal-dir=/root/.ethereum/geth/triedb
INFO [12-24|02:13:51.322] Writing custom genesis block
INFO [12-24|02:13:51.322] Resuming snapshot generation             root=56e81f..63b421 accounts=0 slots=0 storage=0.00B dangling=0 elapsed="623.542µs"
INFO [12-24|02:13:51.322] Generated snapshot                       accounts=0 slots=0 storage=0.00B dangling=0 elapsed="951.133µs"
INFO [12-24|02:13:51.323] Successfully wrote genesis state         database=chaindata hash=5a79c3..3fbb1c
henryjr@henryjr:~/tese/gethlab$ 




## RUN NODE 2




## RUN NODE 3