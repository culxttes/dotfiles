{ username, ... }:

{
  home-manager.users.${username}.xdg.mimeApps = {
    enable = true;
  };
}
