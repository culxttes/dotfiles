{ nvf, username, ... }:

{
  home-manager.users.${username} = {
    imports = [
      # keep-sorted start
      nvf.homeManagerModules.default
      # keep-sorted end
    ];
  };
}
