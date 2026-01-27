docker build -t zk-bridge .

Using https://github.com/zksecurity/stone-cli.git: 

The lifecycle of a Cairo program is composed of mainly four steps: compile & run, prove, serialize, and verify.
Stone CLI does not directly interact with the on-chain verifiers. Instead, it serializes the proof into a format that is compatible with the on-chain verifier.

Using https://github.com/zksecurity/stark-evm-adapter.git since: 

stark-evm-adapter is a library that provides a set of utilities to parse and manipulate the output of the STARK stone proof. Specifically, the library can be used to generate a "split proof", which is necessary for proofs to be verified on Ethereum our Layer 1.


docker build -t zk-bridge .
