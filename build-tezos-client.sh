#!/bin/bash
apt install -y rsync git m4 build-essential patch unzip bubblewrap wget pkg-config libgmp-dev libev-dev libhidapi-dev jq make patch unzip gcc
wget https://github.com/ocaml/opam/releases/download/2.0.3/opam-2.0.3-x86_64-linux
cp opam-2.0.3-x86_64-linux /usr/local/bin/opam
chmod a+x /usr/local/bin/opam
git clone https://gitlab.com/tezos/tezos.git
cd tezos
git checkout alphanet
opam init --bare -a --disable-sandboxing
echo "test -r /root/.opam/opam-init/init.sh && . /root/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true" >> ~/.bashrc
source ~/.bashrc
make build-deps
eval $(opam env)
make
export PATH=~/tezos:$PATH
source ./src/bin_client/bash-completion.sh
export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=Y
