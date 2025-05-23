#!/usr/bin/env bash

set -euo pipefail

# Get the absolute path to the directory of this script
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

FLAKE_URL=$(readlink -f "$SCRIPT_DIR/../../")

echo "  Running flake update"
nix flake update --flake "$FLAKE_URL" 2> /dev/null
echo "  Flake update completed"

