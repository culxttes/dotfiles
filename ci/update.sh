#!/usr/bin/env bash
set -euo pipefail

# Get the directory of this script, even if called from elsewhere
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

SCRIPTS_DIR="$SCRIPT_DIR/script"

if [ ! -d "$SCRIPTS_DIR" ]; then
  echo "Directory $SCRIPTS_DIR does not exist."
  exit 1
fi

echo "[🔁] Running update scripts in $SCRIPTS_DIR"

for script in "$SCRIPTS_DIR"/*.sh; do
  if [ -x "$script" ]; then
    echo "➡️  Executing: $script"
    "$script"
  else
    echo "⚠️  Skipped (not executable): $script"
  fi
done

echo "[✅] All scripts ran successfully."
