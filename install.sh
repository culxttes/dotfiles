#!/bin/bash

# Create symbolic links for hidden files in the current directory
for file in $(pwd)/.[^.]*; do
  if [[ "$(basename "$file")" != .git* ]]; then
    ln -s "$file" "$HOME"
  fi
done

mkdir -p "$HOME/.config"

ln -s "$(pwd)/logo.png" "$HOME/.config"
ln -s "$(pwd)/background.jpeg" "$HOME/.config"

# Create symbolic links for files and directories in the config directory
if [ -d "$(pwd)/config" ]; then

  for file in $(pwd)/config/*; do
    ln -s "$file" "$HOME/.config"
  done
else
  echo "No config directory found in $(pwd)"
fi


echo "All symbolic links created."
