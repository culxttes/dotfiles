{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.texlive = {
      enable = true;
      extraPackages = tpkgs: { inherit (tpkgs) scheme-full; };
    };
  };
}
