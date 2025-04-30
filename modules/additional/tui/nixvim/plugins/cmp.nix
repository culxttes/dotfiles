{
  plugins.cmp = {
    enable = true;

    autoEnableSources = true;

    settings = {
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "vimtex"; }
      ];

      mapping = {
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
      };
    };
  };
}
