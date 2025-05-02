{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    rust-analyzer
    clippy
    cargo
    rustfmt
    lldb
  ];

  plugins.rustaceanvim = {
    enable = true;
    settings = {
      server = {
        default_settings = {
          rust-analyzer = {
            check = {
              command = "clippy";
            };
            inlayHints = {
              lifetimeElisionHints = { enable = "always"; };
            };
          };
        };
        standalone = false;
      };
    };
  };
}
