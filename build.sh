#!/bin/bash
echo "----- Ian's EpicCash ARM build script -----"
echo "I have tested this on a Raspberry Pi 4"
echo "Performance on other boards is unknown"
echo
echo
echo '*** Installing/downloading necessary prerequesites'
git submodule update --init --recursive
sudo apt -y install build-essential cmake git libgit2-dev clang libncurses5-dev libncursesw5-dev zlib1g-dev pkg-config libssl-dev llvm
echo '*** Replacing RandomX with version that supports ARM'
rm randomx-rust/randomx -rf
cd randomx-rust
git clone https://github.com/tevador/RandomX.git randomx
cd ..
echo '*** Finished replacement, now starting compilation'
PATH=$PWD/hacky:$PATH
export PATH
cargo build --release
