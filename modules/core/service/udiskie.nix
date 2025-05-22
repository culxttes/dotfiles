{ pkgs, username, ... }:

{
  users.users.${username}.extraGroups = [
    "storage"
  ];

  home-manager.users.${username} = {
    services.udiskie = {
      enable = true;
    };
  };
}
