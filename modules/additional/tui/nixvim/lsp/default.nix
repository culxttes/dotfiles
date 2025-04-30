{ config, ... }:

{
  imports = [
    (import ./ltex.nix { inherit config; })
  ];
}
