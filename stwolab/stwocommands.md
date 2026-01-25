
## 1. Build the Docker image using a specific dockerfile. 
## --no-cache ensures a fresh build of the Stwo Prover environment.
docker build --no-cache -t stwo-cairo-prover -f .dockerfile .

## 2. Start the container in interactive mode.
## Maps your current directory to /workspace inside the container.
docker run -it --rm -v $(pwd):/workspace --entrypoint bash stwo-cairo-prover

## 3. Execute the Cairo program logic.
## This runs the code, calculates the 500th prime, and generates the execution trace.
## The trace is saved to 'target/execute/prime_calc/execution1'.
scarb execute -p prime_calc --print-program-output --arguments 5

## 4. Generate the STARK proof (Proving stage).
## 'time' measures how long the CPU takes to generate the proof from the trace.
## This creates the mathematical proof that the output '3571' is correct.
time scarb prove --execution-id 1

## 5. Validate the STARK proof (Verification stage).
## 'time' measures how long it takes to verify the proof.
## Verification is usually much faster than proving.
time scarb verify --execution-id 1


## EXTRA for RESOURCES
sudo apt update
sudo apt install htop
htop #computer stats 
docker stats #container stats 
docker ps --no-trunc #active docker containers 