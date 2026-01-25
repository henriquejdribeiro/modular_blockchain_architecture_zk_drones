# Build Container 
docker build --no-cache -t starkli-cli -f Dockerfile.starkli .

# Run Container
docker run -it \
  --network host \
  -v $(pwd):/workspace \
  starkli-cli

# Prepare to talk with Madara Network
export STARKNET_RPC=http://127.0.0.1:9944

# Ask block number 
starkli block-number

# env current variables
env | grep STARKNET

# see file of account 
cat /workspace/account.json

# Inside Container
source /root/.starkli/env
starkliup

# confirm
starkli --version

starkli chain-id \
  --rpc http://127.0.0.1:9944/rpc/v0.9.0/


# Export credentials inside the container
export STARKNET_RPC_URL="http://127.0.0.1:9944/rpc/v0.9.0/"
export STARKNET_ACCOUNT=0x055be462e718c4166d656d11f89e341115b8bc82389c3762a10eade04fcb225d
export STARKNET_PRIVATE_KEY=0x077e56c6dc32d40a67f6f7e6625c8dc5e570abe49c0a24e9202e4ae906abcc07

mkdir -p /root/.starkli/accounts

cat > /root/.starkli/accounts/madara-dev.json <<EOF
{
  "version": 1,
  "address": "0x055be462e718c4166d656d11f89e341115b8bc82389c3762a10eade04fcb225d",
  "private_key": "0x077e56c6dc32d40a67f6f7e6625c8dc5e570abe49c0a24e9202e4ae906abcc07",
  "chain_id": "madara_devnet_2025"
}
EOF

ls /root/.starkli/accounts 
madara-dev.json



# true

root@docker-desktop:/workspace# starkli signer keystore from-key devnet_signer.json
Enter private key: 
Enter password: 
Created new encrypted keystore file: /workspace/devnet_signer.json
Public key: 0x07a3d03f931de9dc9de84a34f385fc609c8822b1a409d2dae5071ad50c1b8b26
root@docker-desktop:/workspace# 



# FOUNDRY 

curl http://host.docker.internal:9944/rpc/v0.9.0 \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc":"2.0",
    "id":1,
    "method":"starknet_chainId",
    "params":[]
  }'

root@15cd394706fa:/app# sncast account import --name hjdr --address 0x0733a8e2bcced14dcc2608462bd96524fb64eef061689b6d976708efc2c8ddfd --private-key 0x00177100ae65c71074126963e695e17adf5b360146f960378b5cdfd9ed69870b --type oz --url http://host.docker.internal:9944/rpc/v0.8.
1
✔ Do you want to make this account default? · Yes, global default (~/.config/starknet-foundry/snfoundry.toml)
Success: Account imported successfully

Account Name: hjdr
root@15cd394706fa:/app# 


curl -L https://github.com/software-mansion/scarb/releases/download/v2.6.4/scarb-v2.6.4-x86_64-unknown-linux-gnu.tar.gz \
  -o scarb.tar.gz

root@15cd394706fa:/app# tar -xzf scarb.tar.gz
root@15cd394706fa:/app# mv scarb-v2.6.4/bin/scarb /usr/local/bin/scarb
mv: cannot stat 'scarb-v2.6.4/bin/scarb': No such file or directory
root@15cd394706fa:/app# chmod +x /usr/local/bin/scarb
chmod: cannot access '/usr/local/bin/scarb': No such file or directory
root@15cd394706fa:/app# scarb --version
bash: scarb: command not found
root@15cd394706fa:/app# ls


root@15cd394706fa:/app/drone_project# curl -L https://raw.githubusercontent.com/software-mansion/universal-sierra-compiler/master/scripts/install.sh | sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  3112  100  3112    0     0   8977      0 --:--:-- --:--:-- --:--:--  8968
Downloading and extracting universal-sierra-compiler-v2.6.0-x86_64-unknown-linux-gnu...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 3549k  100 3549k    0     0  4312k      0 --:--:-- --:--:-- --:--:-- 4312k
universal-sierra-compiler: could not detect shell, manually add /root/.local/bin to your PATH.
root@15cd394706fa:/app/drone_project# export PATH="$HOME/.local/bin:$PATH"
root@15cd394706fa:/app/drone_project# universal-sierra-compiler --version
universal-sierra-compiler 2.6.0
root@15cd394706fa:/app/drone_project# 

root@15cd394706fa:/app/drone_project# sncast declare   --contract-name Drone   --url http://host.docker.internal:9944/rpc/v0.8.1
   Compiling drone_project v0.1.0 (/app/drone_project/Scarb.toml)
    Finished release target(s) in 1 second
Success: Declaration completed

Class Hash:       0x36b517b928fd62c8bf38e86330409e4d2022cb8b33c53a21f42db13075d627d
Transaction Hash: 0x100eb76ec8a6c3c494ffb4a501d2f7af0aa43eca495976deaeffc144bf487
root@15cd394706fa:/app/drone_project# 


root@15cd394706fa:/app/drone_project# sncast deploy --class-hash 0x36b517b928fd62c8bf38e86330409e4d2022cb8b33c53a21f42db13075d627d  --url
 http://host.docker.internal:9944/rpc/v0.8.1
Success: Deployment completed

Contract Address: 0x05e6984046d28a33826dd108962f2ee0d938659bc40031cd0142913894b592af
Transaction Hash: 0x002e52775b01ba8c8016e4b633005c9062d84e46b790808d1abd79d550b85bc2
root@15cd394706fa:/app/drone_project# 


# Madara Contract Interaction
root@15cd394706fa:/app/drone_project# sncast invoke   --contract-address 0x05e6984046d28a33826dd108962f2ee0d938659bc40031cd0142913894b592af   --function decide   --calldata 1   --url http://host.docker.internal:9944/rpc/v0.8.1
Success: Invoke completed

Transaction Hash: 0x0733f2297428c784ccbd4a57cb6ca738feb51a8b25e9f053ffbf08ab11e21bb4
root@15cd394706fa:/app/drone_project# 


# GET Madara Contract Interaction by Hash
root@15cd394706fa:/app/drone_project# curl -X POST http://host.docker.internal:9944/rpc/v0.8.1 \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc":"2.0",
    "method":"starknet_getTransactionByHash",
    "params":["0x0733f2297428c784ccbd4a57cb6ca738feb51a8b25e9f053ffbf08ab11e21bb4"],
    "id":1
  }'
{"jsonrpc":"2.0","result":{"type":"INVOKE","version":"0x3","account_deployment_data":[],"calldata":["0x1","0x5e6984046d28a33826dd108962f2ee0d938659bc40031cd0142913894b592af","0xfaf1912178443f301638daac13698a9e6e3b73097c0a2771758b339f524128","0x1","0x1"],"fee_data_availability_mode":"L1","nonce":"0x2","nonce_data_availability_mode":"L1","paymaster_data":[],"resource_bounds":{"l1_gas":{"max_amount":"0x0","max_price_per_unit":"0xc0"},"l2_gas":{"max_amount":"0x132180","max_price_per_unit":"0x249f0"},"l1_data_gas":{"max_amount":"0x1b0","max_price_per_unit":"0xc0"}},"sender_address":"0x733a8e2bcced14dcc2608462bd96524fb64eef061689b6d976708efc2c8ddfd","signature":["0x68cee1bc9199163137d443e8617f7a43b56e8c6157bc883ea0150b04bd4f94d","0x40c4dcc68f233ed699154a55209698bace0896c2addfb1b14c908c73e6eb8ca"],"tip":"0x0","transac
root@15cd394706fa:/app/drone_project# 

# What it can be done
Use Madara as a data source, Stone as a prover, and Ethereum as the verifier — not as a rollup, but as a zk-attestation system.

Use Madara for execution, zk for statements, Ethereum for verification.

System	       | What is proven
zk rollup	Full | L2 state transition
zk attestation | A statement about data
