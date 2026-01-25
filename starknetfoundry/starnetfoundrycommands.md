docker build -t starknet-foundry -f Dockerfile.starknet-foundry .

docker run -it --rm \
  -v $(pwd):/workspace \
  starknet-foundry


sncast --version
