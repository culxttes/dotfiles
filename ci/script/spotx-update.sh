#!/usr/bin/env bash

set -euo pipefail

URL="https://raw.githubusercontent.com/SpotX-Official/SpotX-Bash/refs/heads/main/spotx.sh"

# Get the absolute path to the directory of this script
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

OVERLAY_PATH=$(readlink -f "$SCRIPT_DIR/../../modules/desktop/gui/spotify/spotx.nix")

echo "  Fetching new hash for: $URL"
HASH_RAW=$(nix-prefetch-url "$URL" 2> /dev/null)
NEW_HASH=$(nix hash convert sha256:$HASH_RAW)

echo "  New hash is: $NEW_HASH"

sed -i -E "s|sha256-[^\"]+|${NEW_HASH}|" "$OVERLAY_PATH"

echo "  Hash updated in $OVERLAY_PATH"
