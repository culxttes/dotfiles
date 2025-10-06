{
  pkgs,
  config,
  username,
  ...
}:

{
  imports = [
    # keep-sorted start
    ./secrets
    # keep-sorted end
  ];

  services.github-runners = {
    dotfiles = {
      enable = true;

      name = "nixos-runner";

      url = "https://github.com/culxttes/dotfiles";

      extraPackages = with pkgs; [
        git
        gnupg
        gawk
      ];

      tokenFile = config.sops.secrets."github-runner/dotfiles/token".path;
    };
  };
}
