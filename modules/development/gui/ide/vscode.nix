{ pkgs, username, ... }:
/*
  Installs the Visual Studio Code Insiders edition by:
   - Overriding the default `vscode` package to set `isInsiders = true`,
   enabling the nightly build.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      ((pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: rec {
        src = (
          builtins.fetchTarball {
            url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
            sha256 = "1m8kzz4pjfwi19ra6jz8m2c7ni9mfsdvgx1nws2xzsz1j8qbji48";
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
