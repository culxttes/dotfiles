{ username, ... }:

{
  home-manager.users.${username} = {
    services.ssh-agent = {
      enable = true;
    };
  };
}
