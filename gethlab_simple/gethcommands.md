# L1 commands on ~/blockchain-l1/

1. Setup Commands
# Create directory structure
mkdir -p data/node1 passwords

# Create password file
echo "yourpassword" > passwords/node1.txt

# Create account
docker run --rm \
  -v $(pwd)/data/node1:/data \
  -v $(pwd)/passwords/node1.txt:/password.txt \
  ethereum/client-go:v1.10.17 account new --datadir /data --password /password.txt

# Initialize blockchain with genesis
docker run --rm \
  -v $(pwd)/genesis.json:/genesis.json \
  -v $(pwd)/data/node1:/root/.ethereum \
  ethereum/client-go:v1.10.17 init /genesis.json

# Start the node
docker compose up -d

# View logs
docker compose logs -f node1


2. Useful Commands
# Stop the node
docker compose down

# Clean restart
docker compose down --remove-orphans
rm -rf ./data/node1
# Then re-run initialization and start commands

# Attach to console
docker exec -it geth-node1 geth attach /data/geth.ipc

# Check if mining is working
docker exec -it geth-node1 geth attach /data/geth.ipc --exec "eth.blockNumber"



3. EXTRA Commands
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


# NODE 1 Account Output 

INFO [01-06|01:00:25.627] Maximum peer count                       ETH=50 LES=0 total=50
INFO [01-06|01:00:25.627] Smartcard socket not found, disabling    err="stat /run/pcscd/pcscd.comm: no such file or directory"

Your new key was generated

Public address of the key:   0x0b71F8a20f6E71EdFa442d165AF55a164167B91c
Path of the secret key file: /data/keystore/UTC--2026-01-06T01-00-25.627259731Z--0b71f8a20f6e71edfa442d165af55a164167b91c

- You can share your public address with anyone. Others need it to interact with you.
- You must NEVER share the secret key with anyone! The key controls access to your funds!
- You must BACKUP your key file! Without the key, it's impossible to access account funds!
- You must REMEMBER your password! Without the password, it's impossible to decrypt the key!

# Blockchain Start Output 

henryjr@henryjr:~/tese/gethlab_simple$ docker run --rm \
  -v $(pwd)/genesis.json:/genesis.json \
  -v $(pwd)/data/node1:/root/.ethereum \
  ethereum/client-go:v1.10.17 init /genesis.json
INFO [01-06|01:06:07.880] Maximum peer count                       ETH=50 LES=0 total=50
INFO [01-06|01:06:07.880] Smartcard socket not found, disabling    err="stat /run/pcscd/pcscd.comm: no such file or directory"
INFO [01-06|01:06:07.881] Set global gas cap                       cap=50,000,000
INFO [01-06|01:06:07.881] Allocated cache and file handles         database=/root/.ethereum/geth/chaindata cache=16.00MiB handles=16
INFO [01-06|01:06:07.892] Writing custom genesis block 
INFO [01-06|01:06:07.892] Persisted trie from memory database      nodes=0 size=0.00B time="29.397µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [01-06|01:06:07.892] Successfully wrote genesis state         database=chaindata                      hash=9155bb..ae0a6d
INFO [01-06|01:06:07.893] Allocated cache and file handles         database=/root/.ethereum/geth/lightchaindata cache=16.00MiB handles=16
INFO [01-06|01:06:07.903] Writing custom genesis block 
INFO [01-06|01:06:07.903] Persisted trie from memory database      nodes=0 size=0.00B time="6.464µs"  gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [01-06|01:06:07.903] Successfully wrote genesis state         database=lightchaindata                      hash=9155bb..ae0a6d
henryjr@henryjr:~/tese/gethlab_simple$ 