#!/bin/bash

for file in $(pwd)/.[^.]*; do
  if [[ "$(basename "$file")" != .git* ]]; then
    ln -s "$file" "$HOME"
  fi
done

mkdir -p "$HOME/.config"

ln -s "$(pwd)/logo.png" "$HOME/.config"
ln -s "$(pwd)/background.jpeg" "$HOME/.config"

if [ -d "$(pwd)/config" ]; then
  for file in $(pwd)/config/*; do
    ln -s "$file" "$HOME/.config"
  done
else
  echo "No config directory found in $(pwd)"
fi

if [ -d "$(pwd)/bin" ]; then
  for file in $(pwd)/bin/*; do
    sudo ln -s "$file" "/usr/local/bin"
  done
else
  echo "No binary directory found in $(pwd)"
fi

echo "All symbolic links created."
