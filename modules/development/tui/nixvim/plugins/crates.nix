{ username, ... }:

{
  home-manager.users.${username}.programs.nixvim = {
    plugins.crates.enable = true;
  };
}
