# NFT-Staking


The NFT staking protocol for the [Afristore Marketplace](https://github.com/Afristore/marketplace) 

This Soroban smart contract implements:
- `stake` — Lock an NFT into the staking contract to begin earning rewards
- `unstake` — Withdraw a staked NFT back to the owner's wallet
- `claim_rewards` — Claim accumulated staking rewards
- `get_staked` — Query all NFTs staked by a given address
- `get_rewards` — Query unclaimed rewards for a given address
- TTL extension logic to prevent staked records from archiving on Stellar

---

## Getting Started 

```bash
# Build the contract WASM
cargo build --target wasm32-unknown-unknown --release

# Run all tests
cargo test --features testutils

# Check formatting and linting
cargo fmt --check
cargo clippy -- -D warnings

# Optimize the WASM binary
stellar contract optimize --wasm target/wasm32-unknown-unknown/release/nft_staking.wasm

# Deploy to testnet
stellar contract deploy --wasm target/wasm32-unknown-unknown/release/nft_staking.optimized.wasm --network testnet
```

---

## Prerequisites

- Rust (stable)
- `wasm32-unknown-unknown` target: `rustup target add wasm32-unknown-unknown`
- Stellar CLI: `cargo install --locked stellar-cli`

---

## Security

All state-changing functions (`stake`, `unstake`, `claim_rewards`) require caller authorization via `require_auth`. Non-authorized calls will panic.

---

## Contributing

1. Fork this repository
2. Create a feature branch: `git checkout -b feat/your-feature`
3. Make your changes and ensure all CI checks pass:
   - `cargo fmt --check` — must exit 0
   - `cargo clippy -- -D warnings` — zero warnings
   - `cargo test --features testutils` — full staking lifecycle tests must pass (stake → earn → unstake → claim)
   - `cargo build --target wasm32-unknown-unknown --release` — must produce a valid WASM
4. Open a PR — **all CI must pass before a PR is eligible for review and merge**

---

## 📦 Tech Stack

- Rust + `soroban-sdk v25.3.0`
- Stellar / Soroban smart contract platform

---

## 📄 License

MIT — see [LICENSE](./LICENSE)
