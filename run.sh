#!/bin/bash

set -eux -o pipefail

# Get the directory that this script file is in
THIS_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$THIS_DIR"

ARGUMENT="${1:-help}"

function help() {
    echo "Known arguments are: glitch-install glitch help";
}

case "$ARGUMENT" in
glitch-install)
    BIN_DIR="/app/bin"
    HUGO_VERSION="0.55.6"
    HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz"

    mkdir -p "$BIN_DIR"
    curl -L "$HUGO_URL" | tar xz -C "$BIN_DIR"
    ;;

glitch)
    hugo serve --port 3000
    ;;

help)
    help
    exit 2
    ;;

*)
    echo "Unknown argument: $ARGUMENT"
    exit 1
    ;;
esac
