{ username, ... }:

{
  imports = [
    ../none-ls
  ];

  home-manager.users.${username}.programs.nixvim.plugins.none-ls = {
    enable = true;
  };
}
