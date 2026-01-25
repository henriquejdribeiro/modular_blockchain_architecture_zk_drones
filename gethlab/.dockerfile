# Base Image
FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt-get install -y wget tar curl

# Copy start.sh into the image
COPY start.sh /start.sh

# Make it executable
RUN chmod +x /start.sh

# Download Geth (alltools version)
RUN wget https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.16.7-b9f3a3d9.tar.gz -O /tmp/geth.tar.gz

# Extract Geth
RUN tar -xvzf /tmp/geth.tar.gz -C /tmp

# Move the main geth binary into PATH
RUN mv /tmp/geth-alltools-linux-amd64-1.16.7-b9f3a3d9/geth /usr/local/bin/geth

# Optional: verify installation
RUN geth version

# Default entrypoint (overridden for each node in docker-compose)
ENTRYPOINT ["/start.sh"]

