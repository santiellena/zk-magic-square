# Set Up

## Dependencies
The core of Circom is written in Rust, so we will need it to first install Circom:

To install `rustup`:
```bash
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

To install Rust:
```bash
# You might have problems with your terminal recognizing the command 
# if you didn't follow the recomendations when rustup was installed
rustup
```

The tool we will use to generate and validate ZK proofs is a `npm` dependency so we need to install `nodejs`(version 10 or higher): https://nodejs.org/en/download


## Circom

First we need to clone the iden3 circom repository:
```bash
git clone https://github.com/iden3/circom.git
```

Then build it with `cargo`:
```bash
cargo build --release
```

and install Circom:
```bash
# This might take a while, don't worry
cargo install --path circom
```

## SnarkJS

Install `snarkjs` with the following command:
```bash
npm install -g snarkjs
```