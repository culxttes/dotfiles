{ username, ... }:

{
  imports = [
    # keep-sorted start
    ./keymaps.nix
    # keep-sorted end
  ];

  home-manager.users.${username}.programs.nvf.settings.vim = {
    lsp = {
      enable = true;

      formatOnSave = true;

      lspconfig = {
        enable = true;
      };

      inlayHints.enable = true;
    };
  };
}
