{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = [
      ((pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: rec {
        src = (
          builtins.fetchTarball {
            url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
            sha256 = "1k075mpdgkgr7079jllsb1jiwxvljr61asqw9hzbng0agba82p7h";
          }
        );
        version = "latest";
        buildInputs = oldAttrs.buildInputs ++ [
          pkgs.krb5
        ];
      }))
    ];
  };
}
