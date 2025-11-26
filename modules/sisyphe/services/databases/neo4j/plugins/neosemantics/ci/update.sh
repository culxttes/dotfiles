#!/usr/bin/env bash

set -euo pipefail

# Get the absolute path to the directory of this script
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
PLUGIN_PATH=$(readlink -f "$SCRIPT_DIR/../default.nix")

REPO_URL="https://github.com/neo4j-labs/neosemantics/"
VERSION=$(nix run nixpkgs\#curl -- -s "https://api.github.com/repos/neo4j-labs/neosemantics/releases/latest" | nix run nixpkgs\#jq -- -r ".tag_name")

FILE_URL="${REPO_URL}releases/download/${VERSION}/neosemantics-${VERSION}.jar"

echo $FILE_URL

echo "Fetching new hash for: $FILE_URL"
HASH_RAW=$(nix-prefetch-url "$FILE_URL")
NEW_HASH=$(nix hash convert sha256:$HASH_RAW)

echo "New hash is: $NEW_HASH"

sed -i -E "s|sha256-[^\"]+|${NEW_HASH}|" "$PLUGIN_PATH"
sed -i -E "s|version = \"[^\"]+\"|version = \"${VERSION}\"|" "$PLUGIN_PATH"

echo "Hash updated in $PLUGIN_PATH"

git add "$PLUGIN_PATH"
git commit -m "chore(neo4j/plugins/neosemantics): update to lastest version" || true
