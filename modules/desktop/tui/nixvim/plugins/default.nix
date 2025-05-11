{ config, ... }:

{
  imports = [
    ./vimtex.nix
    ./rustaceanvim.nix
    ./crates.nix
    ./lsp.nix
    ./markdown-preview.nix
    ./peek.nix
  ];
}
