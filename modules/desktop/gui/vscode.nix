{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = [
      ((pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: rec {
        src = (builtins.fetchTarball {
          url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
          sha256 = "14h2jmlb8qb9bkmcxza5w74kys8092cm8dzrnxm3s67gh063hnr0";
        });
        version = "latest";
        buildInputs = oldAttrs.buildInputs ++ [ pkgs.krb5 ];
      }))
    ];
  };
}
