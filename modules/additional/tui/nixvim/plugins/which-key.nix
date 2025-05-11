{ username, ... }:

{
  home-manager.users.${username}.programs.nixvim = {
    plugins.which-key.enable = true;
  };
}
