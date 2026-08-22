#!/bin/bash
set -e

echo "Building NFT-Staking contract..."
cargo build --target wasm32v1-none --release

echo "Optimizing contract..."
stellar contract optimize --wasm target/wasm32v1-none/release/nft_staking.wasm

echo "Build and optimization complete!"
