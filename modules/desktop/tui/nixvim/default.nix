{ config, pkgs, nixvim, username, ... }:

{
  home-manager.users.${username} = {
    programs.nixvim = {
      imports = [
        (import ./plugins { inherit config; })
      ];
    };
  };
}
