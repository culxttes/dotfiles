{ username, ... }:

{
  home-manager.users.${username}.programs.nixvim.plugins.peek = {
    enable = true;

    settings = {
      theme = "light";
    };
  };
}
