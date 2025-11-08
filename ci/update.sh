#!/usr/bin/env bash
set -euo pipefail

# Get the directory of this script, even if called from elsewhere
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
SCRIPTS_DIR="$SCRIPT_DIR/updates"
MODULES_DIR="$SCRIPT_DIR/../modules"

# Function to execute a script with error handling
execute_script() {
  local script="$1"
  
  # Make script executable if it isn't
  if [ ! -x "$script" ]; then
    chmod +x "$script"
  fi
  
  echo "➡️  Executing: $script"
  "$script" 2>&1 | sed 's/^/  /'
}

# Counter for statistics
total_executed=0

echo "[🔁] Running update scripts"
echo ""

echo "📁 Processing scripts in $SCRIPTS_DIR"
for script in "$SCRIPTS_DIR"/*.sh; do
  # Check if glob matched any files
  [ -e "$script" ] || continue
  
  execute_script "$script"
  ((total_executed++))
done
echo ""

echo "📁 Processing ci/run.sh scripts in $MODULES_DIR"

# Find all ci/run.sh files recursively
while IFS= read -r -d '' script; do
  execute_script "$script"
  ((total_executed++))
done < <(find "$MODULES_DIR" -type f -path "*/ci/update.sh" -print0 2>/dev/null)

echo ""

# Display summary
echo "[✅] All scripts completed successfully."
echo "📊 Summary: $total_executed executed"

if git diff --quiet && git diff --cached --quiet; then
    exit 0
fi

git add -A
git commit -m "chore: auto-update scripts output"
