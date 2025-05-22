#!/usr/bin/env bash

set -euo pipefail

URL="https://code.visualstudio.com/sha/download?build=insider&os=linux-x64"
NAME="vscode-insiders"

# Get the absolute path to the directory of this script
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

NIX_FILE=$(readlink -f "$SCRIPT_DIR/../../modules/desktop/gui/development/vscode.nix")

echo "  Fetching new hash for: $URL"
HASH_RAW=$(nix-prefetch-url --name "$NAME" --unpack "$URL" 2> /dev/null)
NEW_HASH=$(nix hash convert --to nix32 "sha256:$HASH_RAW")

echo "  New hash is: $NEW_HASH"

sed -i -E "s|sha256 = \"[a-z0-9]+\";|sha256 = \"${NEW_HASH}\";|" "$NIX_FILE"

echo "  Hash updated in $NIX_FILE"
