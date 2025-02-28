#!/usr/bin/env bash

set -eo pipefail

# Utility for running a temporary dapp testnet w/ an ephemeral account
# to be used for deployment tests

# make a temp dir to store testnet info
export TMPDIR=$(mktemp -d)

# clean up
trap 'killall geth && sleep 3 && rm -rf "$TMPDIR"' EXIT
trap "exit 1" SIGINT SIGTERM

# test helper
error() {
    printf 1>&2 "fail: function '%s' at line %d.\n" "${FUNCNAME[1]}"  "${BASH_LINENO[0]}"
    printf 1>&2 "got: %s" "$output"
    exit 1
}

# launch the testnet
dapp testnet --dir "$TMPDIR" &
# wait for it to launch (can't go <3s)
sleep 10

# set the RPC URL to the local testnet
export ETH_RPC_URL=http://127.0.0.1:8545

export ETH_KEYSTORE=$TMPDIR/8545/keystore
export ETH_PASSWORD=/dev/null

# get the created account (it's unlocked so we only need to set the address)
export ETH_FROM=$(seth ls --keystore $ETH_KEYSTORE | cut -f1)
