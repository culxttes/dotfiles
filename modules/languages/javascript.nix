{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.deno
      pkgs.nodejs
    ];
  };
}
