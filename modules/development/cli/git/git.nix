{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.git = {
      extraConfig = {
        commit = {
          gpgSign = true;
        };
      };
    };
  };
}
