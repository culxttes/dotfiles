{ config, ... }:

{
  imports = [
    ./lualine.nix
    ./treesitter.nix
    ./vimtex.nix
    ./which-key.nix
    ./nvim-tree.nix
    ./web-devicons.nix
    ./virt-column.nix
    ./rustaceanvim.nix
    ./crates.nix
    (import ./lsp.nix { inherit config; })
    ./bufferline.nix
    ./toggleterm.nix
    ./telescope.nix
    ./markdown-preview.nix
    ./mini.nix
    ./cmp.nix
    ./none-ls.nix
  ];
}
