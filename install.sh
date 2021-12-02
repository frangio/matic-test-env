#!/usr/bin/env bash

set -euo pipefail

apt-get update -y
apt-get install -y curl gnupg git build-essential apt-transport-https screen

# docker, go, node 10
curl -fsSL https://get.docker.com | sh
curl -L "https://go.dev/dl/go1.17.3.linux-amd64.tar.gz" | tar -xzC /usr/local
curl -fsSL https://deb.nodesource.com/setup_10.x | bash -
apt-get install -y nodejs

# solc
curl -Lo /usr/bin/solc "https://github.com/ethereum/solidity/releases/download/v0.5.11/solc-static-linux"
chmod +x /usr/bin/solc

# matic, ganache
npm install -g @maticnetwork/matic-cli ganache-cli

cd matic
patch /usr/lib/node_modules/@maticnetwork/matic-cli/src/setup/config.js fix-matic-cli.patch
matic-cli setup localnet
