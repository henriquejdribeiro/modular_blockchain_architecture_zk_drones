FROM python:3.9-slim

# System dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    curl \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Rust (official way)
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /snos

# Clone SNOS
RUN git clone https://github.com/keep-starknet-strange/snos.git .

# Python deps (some SNOS tools still rely on Python)
RUN pip install --upgrade pip \
 && pip install -r requirements.txt \
 && pip install cairo-lang

CMD ["bash"]
