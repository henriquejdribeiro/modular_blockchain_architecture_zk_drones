# Dockerfile for building and running the stwo-cairo prover
# This container allows to compile Cairo programs and generate STWO proofs

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# ---- System dependencies ----
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    ca-certificates \
    pkg-config \
    libssl-dev \
    clang \
    cmake \
    && rm -rf /var/lib/apt/lists/*

# ---- Install Rust ----
ENV RUSTUP_HOME=/opt/rustup \
    CARGO_HOME=/opt/cargo \
    PATH=/opt/cargo/bin:$PATH

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable

# ---- Install Cairo toolchain (Scarb) ----
# stwo-cairo relies on the modern Cairo v1 toolchain
RUN curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh || true

# The installer places the Scarb binary in ~/.local/bin
# Explicitly add it to PATH
ENV PATH="/root/.local/bin:${PATH}"

# ---- Clone stwo-cairo ----
WORKDIR /opt
RUN git clone https://github.com/starkware-libs/stwo-cairo.git

WORKDIR /opt/stwo-cairo/cairo-prove

# ---- Build the prover binaries ----
# This will compile all Rust crates, including the prover
RUN ./build.sh

# ---- Runtime image ----
# Keep everything in one image so proofs can be generated later without rebuild
ENV STWO_CAIRO_HOME=/opt/stwo-cairo

# Default workdir for mounting Cairo projects
WORKDIR /workspace

# Example entrypoint: run prover help
ENTRYPOINT ["/opt/stwo-cairo/cairo-prove/target/release/cairo-prove"]
CMD ["--help"]
