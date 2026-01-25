cairo_dev -> Cairo Contract declared and deployed on the Madara Lab Chain Simple using Starkli_cli with starkli and sncast commands.  

contracts -> Playground for Solidity and Cairo contracts.

gethlab -> Ethereum layer 1 with more nodes and PoA consensus (only used after zkrollup working).

gethlab_simple -> Ethereum layer 1 with only one node. 

madara_orchestrator -> Madara Orchestrator container needed for the architecture -> https://madara-docs.pages.dev/components/architecture

madaralab -> Madara Layer 2 chain with more nodes (only used after zkrollup working).

madaralab_simple -> Madara Layer 2 chain with only one node, the sequencer.

pathfinder -> Starknet node, used for tests to help on rpc call not implemented yet by Madara starknet_getStorageProofs.

starkli_cli -> Use starkli to import accounts generated from predeployed ones from the start of a madara chain and create a Signer. Using sncast plus account plus the signer, declare and deploy contracts on the madara chain created.

starknet_os -> Starknet Operating System container needed for the architecture -> https://madara-docs.pages.dev/components/architecture

starknetfoundry -> Tests to use sncast, later used on starkli_cli.

stonelab -> Stone prover container with the prover in C++ language and an evm-adapter to send proofs to EVM verifier contracts on Layer 1.

stwolab -> Stwo Cairo prover container with the prover in Rust. No verifier in Ethereum Layer 1 exist for now. Starknet Mainnet uses SHARP a mix of Stwo and Stone. 
