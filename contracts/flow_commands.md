# ------------------------------------------------------------
SUMMARY: 

Madara (L2)
  └─ Counter contract → produces state

STWO
  └─ Proves: new = old + n

Geth (L1)
  └─ Verifier + Core contract → stores result


L2 contracts define what is supposed to happen.
Proofs define that it actually happened correctly.

The L2 Cairo contract represents the application-level state and transition rules of the rollup, while correctness and security are enforced by zk-STARK proofs verified on L1.


Your STWO proof asserts:
“There exists a valid execution of this program whose output equals P, where P is the 500th prime.”

Your L2 contract asserts:
“The current L2 state claims that last_prime = P.”

Your L1 contract asserts:
“I accept P as valid only if there exists a zk-STARK proof attesting that P is the correct output of the agreed program.”

The orchestrator + SNOS are the components that remove the manual trust boundary by cryptographically binding the proof’s public output to the L2 state root.

# ------------------------------------------------------------

1.1 Declare & deploy
starknet declare L2LocalState.cairo --network local
starknet deploy --class_hash <CLASS_HASH> --network local


Save:

L2_CONTRACT_ADDRESS

# ------------------------------------------------------------

2.1 Enter STWO Cairo prover container
docker build --no-cache -t stwo-cairo-prover -f .dockerfile .
docker run -it --rm -v $(pwd):/workspace --entrypoint bash stwo-cairo-prover

2.2 Execute the prime Cairo program

This runs your #[executable] function and produces a trace.

scarb execute -p prime_calc --print-program-output


Expected output:

3571

2.3 Generate the zk-STARK proof
time scarb prove --execution-id 1


Artifacts produced:

execution trace

STARK proof

public output = 3571

# ------------------------------------------------------------

STEP 3 — L1 CONTRACT (Geth)

3.2 Deploy to Geth

Using Foundry or Hardhat:

forge create \
  --rpc-url http://localhost:8545 \
  --private-key <PRIVATE_KEY> \
  L2StateCore


Save:

L1 contract address

# ------------------------------------------------------------

L1 — SUBMIT PROOF (MANUAL SETTLEMENT)

This is the rollup moment.

cast send <L1_CONTRACT_ADDRESS> \
  "updateState(bytes,uint256)" \
  $(cat proof.bin) \
  3571 \
  --rpc-url http://localhost:8545 \
  --private-key <PRIVATE_KEY>


✔️ L1 verifies the proof
✔️ L1 updates canonical state

# ------------------------------------------------------------

4.1 Confirm L1 state
cast call <L1_CONTRACT_ADDRESS> \
  "lastVerifiedPrime()(uint256)" \
  --rpc-url http://localhost:8545


Expected:

3571

# ------------------------------------------------------------

2 — MIRROR THE VERIFIED RESULT (OPTIONAL BUT NICE)

Now that L1 accepted the proof, you reflect it on L2.

starknet invoke \
  --address <L2_CONTRACT_ADDRESS> \
  --function set_prime \
  --inputs 3571 \
  --network local


Verify:

starknet call \
  --address <L2_CONTRACT_ADDRESS> \
  --function get_prime \
  --network local


Expected:

3571


Madara stores application state, STWO proves computation correctness, and L1 finalizes trust via proof verification.

# -----------------------------------------------------

WITH VERIFIER AND CORE CONTRACT

Deployment order (important)

You must deploy in this order:

1. Deploy the verifier
forge create MockVerifier \
  --rpc-url http://localhost:8545 \
  --private-key <PRIVATE_KEY>


Save:

MOCK_VERIFIER_ADDRESS

2. Deploy the core contract with verifier address
forge create L2StateCore \
  --constructor-args <MOCK_VERIFIER_ADDRESS> \
  --rpc-url http://localhost:8545 \
  --private-key <PRIVATE_KEY>


Save:

L2STATECORE_ADDRESS

✅ 5️⃣ Submit proof (unchanged)
cast send <L2STATECORE_ADDRESS> \
  "updateState(bytes,uint256)" \
  $(cat proof.bin) \
  3571 \
  --rpc-url http://localhost:8545 \
  --private-key <PRIVATE_KEY>


Verify:

cast call <L2STATECORE_ADDRESS> \
  "lastVerifiedPrime()(uint256)" \
  --rpc-url http://localhost:8545


Expected:

3571