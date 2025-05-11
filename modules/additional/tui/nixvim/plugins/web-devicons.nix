{ username, ... }:

{
  home-manager.users.${username}.programs.nixvim = {
    plugins.web-devicons.enable = true;
  };
}
