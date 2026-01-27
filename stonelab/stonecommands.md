Using https://github.com/zksecurity/stone-cli.git: 

The lifecycle of a Cairo program is composed of mainly four steps: compile & run, prove, serialize, and verify.
Stone CLI does not directly interact with the on-chain verifiers. Instead, it serializes the proof into a format that is compatible with the on-chain verifier.

Using https://github.com/zksecurity/stark-evm-adapter.git since: 

stark-evm-adapter is a library that provides a set of utilities to parse and manipulate the output of the STARK stone proof. Specifically, the library can be used to generate a "split proof", which is necessary for proofs to be verified on Ethereum our Layer 1.

Once the execution is verified, the input and the output of the program can be registered as a "fact" as on-chain data and can be used by any other smart contracts.

## Command to build the image from Dockerfile recipe:
docker build -t zk-bridge .

## Command to start a container from the image:
