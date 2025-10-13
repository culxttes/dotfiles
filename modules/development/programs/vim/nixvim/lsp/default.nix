{ config, ... }:

{
  imports = [
    # keep-sorted start
    ./ltex.nix
    ./pyright.nix
    ./ruff.nix
    # keep-sorted end
  ];
}
