# Pull the latest nightly image
sudo docker pull ghcr.io/madara-alliance/madara:nightly

# Start Madara
sudo docker compose up -d

# View logs
sudo docker compose logs -f madara

# RESET 
# Parar
sudo docker compose down
# APAGAR todos os dados da blockchain
sudo rm -rf ./madara_db/*
# Iniciar (vai criar genesis block novamente)
sudo docker compose up -d

henryjr@henryjr:~/tese/madaralab_simple$ sudo docker compose down
[+] Running 2/2
 ✔ Container madara-node                Removed                                                                                         0.0s 
 ✔ Network madaralab_simple_madara-net  Removed                                                                                         0.3s 
henryjr@henryjr:~/tese/madaralab_simple$ sudo docker compose up -d
[+] Running 2/2
 ✔ Network madaralab_simple_madara-net  Created                                                                                         0.0s 
 ✔ Container madara-node                Started                                                                                         0.3s 
henryjr@henryjr:~/tese/madaralab_simple$ sudo docker compose logs -f madara
madara-node  | [2026-01-06 02:32:29:043] INFO No private key provided, auto-generating one for block signing
madara-node  | [2026-01-06 02:32:29:046] INFO 🥷  Madara Node
madara-node  | [2026-01-06 02:32:29:046] INFO 💁 Support URL: https://github.com/madara-alliance/madara/issues
madara-node  | [2026-01-06 02:32:29:046] INFO 🏷  Node Name: Madara
madara-node  | [2026-01-06 02:32:29:046] INFO 👤 Role: Sequencer
madara-node  | [2026-01-06 02:32:29:046] INFO 🌐 Network: Madara (chain id `madara_devnet_2025`)
madara-node  | [2026-01-06 02:32:29:050] INFO 💻 Operating system: Linux 12 Debian GNU/Linux
madara-node  | [2026-01-06 02:32:29:050] INFO 💻 CPU architecture: x86_64
madara-node  | [2026-01-06 02:32:29:050] INFO 💻 CPU: Intel(R) Core(TM) Ultra 9 285H
madara-node  | [2026-01-06 02:32:29:050] INFO 💻 CPU cores: 16
madara-node  | [2026-01-06 02:32:29:050] INFO 💻 Memory: 15674MiB
madara-node  | [2026-01-06 02:32:29:050] INFO 💻 Kernel: 6.6.87.2-microsoft-standard-WSL2
madara-node  | [2026-01-06 02:32:29:050] INFO Cairo native disabled - all contracts will use Cairo VM
madara-node  | [2026-01-06 02:32:29:051] INFO 💾 Opening database at: /madara_db
madara-node  | [2026-01-06 02:32:29:051] INFO 💾  Preconfirmed blocks will be saved to database
madara-node  | [2026-01-06 02:32:29:147] INFO 📝 Database write mode: WAL enabled, fsync disabled (recommended)
madara-node  | [2026-01-06 02:32:29:149] INFO 💼 Starting chain with block: empty state
madara-node  | [2026-01-06 02:32:29:191] INFO ⛏️  Deploying devnet genesis block
madara-node  | [2026-01-06 02:32:29:518] INFO 🙇 Block hash 0x31ae93762aba1d9596d3b95ceb59823fa8ff9f702e10250e2add70ec52d287d computed for #0
madara-node  | 
madara-node  | ==== DEVNET PREDEPLOYED CONTRACTS ====
madara-node  | 
madara-node  | (#1) Address: 0x055be462e718c4166d656d11f89e341115b8bc82389c3762a10eade04fcb225d
madara-node  |   Private key: 0x077e56c6dc32d40a67f6f7e6625c8dc5e570abe49c0a24e9202e4ae906abcc07
madara-node  |   Balance: 10000 STRK, 10000 ETH
madara-node  | 
madara-node  | (#2) Address: 0x008a1719e7ca19f3d91e8ef50a48fc456575f645497a1d55f30e3781f786afe4
madara-node  |   Private key: 0x0514977443078cf1e0c36bc88b89ada9a46061a5cf728f40274caea21d76f174
madara-node  |   Balance: 10000 STRK, 10000 ETH
madara-node  | 
madara-node  | (#3) Address: 0x0733a8e2bcced14dcc2608462bd96524fb64eef061689b6d976708efc2c8ddfd
madara-node  |   Private key: 0x00177100ae65c71074126963e695e17adf5b360146f960378b5cdfd9ed69870b
madara-node  |   Balance: 10000 STRK, 10000 ETH
madara-node  | 
madara-node  | (#4) Address: 0x025073e0772b1e348a5da66ea67fb46f75ecdca1bd24dbbc98567cbf4a0e00b3
madara-node  |   Private key: 0x07ae55c8093920562c1cbab9edeb4eb52f788b93cac1d5721bda20c96100d743
madara-node  |   Balance: 10000 STRK, 10000 ETH
madara-node  | 
madara-node  | (#5) Address: 0x0294f066a54e07616fd0d50c935c2b5aa616d33631fec94b34af8bd4f6296f68
madara-node  |   Private key: 0x02ce1754eb64b7899c64dcdd0cff138864be2514e70e7761c417b728f2bf7457
madara-node  |   Balance: 10000 STRK, 10000 ETH
madara-node  | 
madara-node  | (#6) Address: 0x005d1d65ea82aa0107286e68537adf0371601789e26b1cd6e455a8e5be5c5665
madara-node  |   Private key: 0x037a683c3969bf18044c9d2bbe0b1739897c89cf25420342d6dfc36c30fc519d
madara-node  |   Balance: 10000 STRK, 10000 ETH
madara-node  | 
madara-node  | (#7) Address: 0x01d775883a0a6e5405a345f18d7639dcb54b212c362d5a99087f742fba668396
madara-node  |   Private key: 0x07b4a2263d9cc475816a03163df7efd58552f1720c8df0bd2a813663895ef022
madara-node  |   Balance: 10000 STRK, 10000 ETH
madara-node  | 
madara-node  | (#8) Address: 0x04add50f5bcc31a8418b43b1ddc8d703986094baf998f8e9625e13dbcc3df18b
madara-node  |   Private key: 0x064b37f84e667462b95dc56e3c5e93a703ef16d73de7b9c5bfd92b90f11f90e1
madara-node  |   Balance: 10000 STRK, 10000 ETH
madara-node  | 
madara-node  | (#9) Address: 0x03dbe3dd8c2f721bc24e87bcb739063a10ee738cef090bc752bc0d5a29f10b72
madara-node  |   Private key: 0x0213d0d77d5ff9ffbeabdde0af7513e89aafd5e36ae99b8401283f6f57c57696
madara-node  |   Balance: 10000 STRK, 10000 ETH
madara-node  | 
madara-node  | (#10) Address: 0x07484e8e3af210b2ead47fa08c96f8d18b616169b350a8b75fe0dc4d2e01d493
madara-node  |   Private key: 0x0410c6eadd73918ea90b6658d24f5f2c828e39773819c1443d8602a3c72344c2
madara-node  |   Balance: 10000 STRK, 10000 ETH
madara-node  | 
madara-node  | [2026-01-06 02:32:29:524] INFO 📱 Running JSON-RPC server at http://0.0.0.0:9944/rpc/v0.9.0/ (allowed origins=["*"], supported versions=["/rpc/v0.7.1/", "/rpc/v0.8.1/", "/rpc/v0.9.0/"])
madara-node  | [2026-01-06 02:32:59:492] INFO 🙇 Block hash 0x5390ca48b161e3ec9fdf2a905c15eeb34d64d444bea8d9abf3eb3331d2937ff computed for #1
madara-node  | [2026-01-06 02:32:59:492] INFO ⛏️  Closed block #1 with 0 transactions - 1.411861ms
madara-node  | [2026-01-06 02:33:29:456] INFO 🙇 Block hash 0x4b88fb4272437855ab3b9befb4987c3ae3dc09764f94b305c08e87720ef0900 computed for #2
madara-node  | [2026-01-06 02:33:29:457] INFO ⛏️  Closed block #2 with 0 transactions - 2.982201ms
madara-node  | [2026-01-06 02:33:59:418] INFO 🙇 Block hash 0x13e6fa15852b93ea3e607da6905c3e03eb8f4df872481b01ba50e64147a8aa2 computed for #3
madara-node  | [2026-01-06 02:33:59:418] INFO ⛏️  Closed block #3 with 0 transactions - 626.155µs
madara-node  | [2026-01-06 02:34:29:382] INFO 🙇 Block hash 0x69fcdc221e75f7d1da3f3b294f898e07aac022bd8fe3d44447d3f8101bd1b8f computed for #4
madara-node  | [2026-01-06 02:34:29:383] INFO ⛏️  Closed block #4 with 0 transactions - 1.496775ms








# Deploy contract 
curl https://get.starkli.sh | bash


# Deployed Contract on Madara Chain 

madara-node  | [2026-01-12 01:24:29:250] INFO ⛏️  Closed block #2260 with 0 transactions - 4.848061ms
madara-node  | [2026-01-12 01:25:00:370] INFO 🙇 Block hash 0x5fb4837e97ed2cf4fcb33540c07ac62c5047d3bc36410e7452400716a4d3bce computed for #2261
madara-node  | [2026-01-12 01:25:00:371] INFO ⛏️  Closed block #2261 with 0 transactions - 1.658562ms
madara-node  | [2026-01-12 01:25:17:988] RPC starknet_V0_8_1_specVersion 200 41 bytes - 12.000µs
madara-node  | [2026-01-12 01:25:17:990] RPC starknet_V0_8_1_chainId 200 74 bytes - 16.000µs
madara-node  | [2026-01-12 01:25:17:992] RPC starknet_V0_8_1_getNonce 200 39 bytes - 100.000µs
madara-node  | [2026-01-12 01:25:17:994] RPC starknet_V0_8_1_getClass 200 8342 bytes - 272.000µs
madara-node  | [2026-01-12 01:25:18:001] RPC starknet_V0_8_1_getNonce 200 39 bytes - 85.000µs
madara-node  | [2026-01-12 01:25:18:010] RPC starknet_V0_8_1_estimateFee 200 235 bytes - 7.159ms
madara-node  | [2026-01-12 01:25:18:013] INFO 🔖 Inserted 1 transaction to the mempool [1/10000 transaction(s), 1 account(s), 1 ready]
madara-node  | [2026-01-12 01:25:18:013] RPC starknet_V0_8_1_addInvokeTransaction 200 121 bytes - 1.154ms
madara-node  | [2026-01-12 01:25:18:017] RPC starknet_V0_8_1_chainId 200 74 bytes - 11.000µs
madara-node  | [2026-01-12 01:25:18:030] INFO 🧮 Executed and added 1 transaction(s) to the preconfirmed block at height 2262 - 16.001ms
madara-node  | [2026-01-12 01:25:31:485] INFO 🙇 Block hash 0x6a02e8dbdafe1b14289e8b396c216ac268e59b16bc50fde95138979029918e5 computed for #2262
madara-node  | [2026-01-12 01:25:31:486] INFO ⛏️  Closed block #2262 with 1 transactions - 4.982503ms
madara-node  | [2026-01-12 01:26:02:607] INFO 🙇 Block hash 0x710dd44f68f762de618e860152e28659e440dd554cc3fe8ab4e3a99049274ec computed for #2263


# Contract Interaction Madara Chain
madara-node  | [2026-01-12 01:37:58:741] INFO 🙇 Block hash 0x36cb5d28711964e5792432e5a1762369f73e186565c81c7f07f509d3035551c computed for #2286
madara-node  | [2026-01-12 01:37:58:741] INFO ⛏️  Closed block #2286 with 0 transactions - 1.578482ms
madara-node  | [2026-01-12 01:38:16:391] RPC starknet_V0_8_1_specVersion 200 41 bytes - 15.000µs
madara-node  | [2026-01-12 01:38:16:394] RPC starknet_V0_8_1_chainId 200 74 bytes - 12.000µs
madara-node  | [2026-01-12 01:38:16:395] RPC starknet_V0_8_1_getNonce 200 39 bytes - 107.000µs
madara-node  | [2026-01-12 01:38:16:396] RPC starknet_V0_8_1_getClassHashAt 200 101 bytes - 96.000µs
madara-node  | [2026-01-12 01:38:16:397] RPC starknet_V0_8_1_getClass 200 8342 bytes - 169.000µs
madara-node  | [2026-01-12 01:38:16:399] RPC starknet_V0_8_1_getNonce 200 39 bytes - 42.000µs
madara-node  | [2026-01-12 01:38:16:405] RPC starknet_V0_8_1_estimateFee 200 236 bytes - 3.649ms
madara-node  | [2026-01-12 01:38:16:409] INFO 🔖 Inserted 1 transaction to the mempool [1/10000 transaction(s), 1 account(s), 1 ready]
madara-node  | [2026-01-12 01:38:16:409] RPC starknet_V0_8_1_addInvokeTransaction 200 122 bytes - 2.667ms
madara-node  | [2026-01-12 01:38:16:411] RPC starknet_V0_8_1_chainId 200 74 bytes - 8.000µs
madara-node  | [2026-01-12 01:38:16:419] INFO 🧮 Executed and added 1 transaction(s) to the preconfirmed block at height 2287 - 8.734ms
madara-node  | [2026-01-12 01:38:29:905] INFO 🙇 Block hash 0x6ce237661d16cd64f7afa94fcd6901853546f9cbc79e8daed0f93b5ae2b7c7e computed for #2287
madara-node  | [2026-01-12 01:38:29:906] INFO ⛏️  Closed block #2287 with 1 transactions - 10.595394ms
madara-node  | [2026-01-12 01:39:01:028] INFO 🙇 Block hash 0x7c7d7f21d6ebade3376e4ff0df27a8c47cd7f83f431500f9187a557225674d computed for #2288


# Contract Interaction Madara Chain
madara-node  | [2026-01-12 01:43:41:275] INFO ⛏️  Closed block #2297 with 0 transactions - 9.00377ms
madara-node  | [2026-01-12 01:44:04:545] RPC starknet_V0_8_1_specVersion 200 41 bytes - 13.000µs
madara-node  | [2026-01-12 01:44:04:549] RPC starknet_V0_8_1_getClassHashAt 200 101 bytes - 102.000µs
madara-node  | [2026-01-12 01:44:04:550] RPC starknet_V0_8_1_getClass 200 8342 bytes - 119.000µs
madara-node  | [2026-01-12 01:44:04:556] RPC starknet_V0_8_1_call 200 41 bytes - 2.011ms
madara-node  | [2026-01-12 01:44:12:408] INFO 🙇 Block hash 0x537d6e54d96d1e8eb40fd66350fef7dc71dad78a8e5abaaa5da5c7cbc78a746 computed for #2298


# Cairo Contract Deployment Flow 
1. (Import Account) Using Sncast commands from https://foundry-rs.github.io/starknet-foundry/starknet/account-import.html import an account from the DEVNET PREDEPLOYED CONTRACTS as seen after initializing the Madara Chain, for example:

sncast account import --name hjdr --address 0x0733a8e2bcced14dcc2608462bd96524fb64eef061689b6d976708efc2c8ddfd --private-key 0x00177100ae65c71074126963e695e17adf5b360146f960378b5cdfd9ed69870b --type oz --url http://host.docker.internal:9944/rpc/v0.8.1

2. (Create Signer) Using Starkli commands from https://book.starkli.rs/signers create a signer for this account for the respective predeployed account, for example:

starkli signer keystore from-key devnet_signer.json
Enter private key: 
Enter password: 
Created new encrypted keystore file: /workspace/devnet_signer.json
Public key: 0x07a3d03f931de9dc9de84a34f385fc609c8822b1a409d2dae5071ad50c1b8b26

3. (Declare Contract)

4. (Deploy Contract)
