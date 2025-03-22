{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.git = {
      enable = true;
      userName = "Lurgrid";
      userEmail = "lurgrid@sagbot.com";
      extraConfig = {
        commit = {
          gpgSign = true;
        };
      };
    };
  };
}
