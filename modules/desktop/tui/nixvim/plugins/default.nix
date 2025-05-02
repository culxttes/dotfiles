{ config, ... }:

{
  imports = [
    ./vimtex.nix
    ./rustaceanvim.nix
    ./crates.nix
    (import ./lsp.nix { inherit config; })
    ./markdown-preview.nix
    ./peek.nix
  ];
}
