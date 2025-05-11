{ username, ... }:

{
  home-manager.users.${username}.programs.nixvim.plugins.mini.enable = true;
}
