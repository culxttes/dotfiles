{ username, ... }:

{
  imports = [
    # keep-sorted start
    ../none-ls
    # keep-sorted end
  ];

  home-manager.users.${username}.programs.nixvim.plugins.none-ls = {
    enable = true;
  };
}
