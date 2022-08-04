FROM node:lts-bullseye

RUN apt-get update && apt-get install -y pkg-config build-essential libudev-dev

# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install solana tool
RUN sh -c "$(curl -sSfL https://release.solana.com/v1.10.32/install)"

# Add solana tool to PATH 
ENV PATH="/root/.local/share/solana/install/active_release/bin:$PATH"

# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Install AVM
RUN cargo install --git https://github.com/project-serum/anchor avm --locked --force

# install Anchor
RUN avm install 0.25.0 && avm use 0.25.0
