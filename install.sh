#!/bin/bash

# Get the current directory
current_dir=$(pwd)

# Get the home directory of the user
home_dir=$HOME

# Directory for symbolic links for bin files
bin_target_dir="/usr/local/bin"

# Directory for symbolic links for config files
config_target_dir="$home_dir/.config"

# Create symbolic links for hidden files in the current directory
for file in $current_dir/.[^.]*; do
  if [[ "$(basename "$file")" != .git* ]]; then
    # Create a symbolic link in the home directory
    ln -s "$file" "$home_dir"
  fi
done

# Create symbolic links for files and directories in the config directory
if [ -d "$current_dir/config" ]; then
  # Create the target .config directory if it doesn't exist
  mkdir -p "$config_target_dir"

  for file in $current_dir/config/*; do
    # Create a symbolic link in ~/.config
    ln -s "$file" "$config_target_dir"
  done
else
  echo "No config directory found in $current_dir"
fi

# Create symbolic links for files in the bin directory
if [ -d "$current_dir/bin" ]; then
  for file in $current_dir/bin/*; do
    if [ -f "$file" ]; then
      # Create a symbolic link in /usr/local/bin
      sudo ln -s "$file" "$bin_target_dir"
    fi
  done
else
  echo "No bin directory found in $current_dir"
fi

echo "All symbolic links created."
