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
            sha256 = "0v06gp79yp8c75bcxz8gsd1snz782qglaid21l919fchsjbz9211";
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
