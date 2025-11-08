#!/usr/bin/env bash

set -euo pipefail

# Get the absolute path to the directory of this script
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

FLAKE_URL=$(readlink -f "$SCRIPT_DIR/../../")

echo "  Running flake update"
nix flake update --flake "$FLAKE_URL"
echo "  Flake update completed"

if git diff --quiet "$FLAKE_URL/flake.nix" && git diff --cached --quiet "$TARGET_PATH/flake.nix"; then
    exit 0
fi

git add "$TARGET_PATH/flake.nix"
git commit -m "chore(flake.lock): update dependencies"
