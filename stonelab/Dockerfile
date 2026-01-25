FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    python3 \
    python3-pip \
    libgmp-dev \
    libssl-dev \
    pkg-config \
    cmake \
    && rm -rf /var/lib/apt/lists/*

ENV OPENSSL_DIR=/usr
ENV OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu
ENV OPENSSL_INCLUDE_DIR=/usr/include

# Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN pip3 install --upgrade pip setuptools wheel

WORKDIR /opt
RUN git clone https://github.com/zksecurity/stone-cli.git
RUN git clone https://github.com/zksecurity/stark-evm-adapter.git

# Build stone-cli
WORKDIR /opt/stone-cli
RUN cargo build --release

# Build stark-evm-adapter
WORKDIR /opt/stark-evm-adapter
RUN cargo build --release

WORKDIR /app
CMD ["bash"]
