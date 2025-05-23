{
  pkgs,
  username,
  fenix,
  ...
}:

let
  nightlyToolchain = fenix.packages.${pkgs.system}.complete.withComponents [
    "rustc"
    "cargo"
    "clippy"
    "rustfmt"
    "rust-analyzer"
  ];
in
{
  home-manager.users.${username}.programs.nixvim = {
    extraPackages = with pkgs; [
      nightlyToolchain
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
                lifetimeElisionHints = {
                  enable = "always";
                };
              };
            };
          };
          standalone = false;
        };
      };
    };
  };
}
