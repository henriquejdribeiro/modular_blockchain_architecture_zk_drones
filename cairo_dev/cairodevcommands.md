
# Build Container
docker build -t cairo-dev -f Dockerfile.cairo-dev .

#
apt update && apt install -y nano
Scarb init
scarb build

#


#