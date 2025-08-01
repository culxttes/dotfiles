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
            sha256 = "0f3r8q85cszn8bmjvzv0k29fcfvqwbk60gz9zgcwypf1fd4qh0sh";
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
