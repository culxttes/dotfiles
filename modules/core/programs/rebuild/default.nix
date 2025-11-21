{
  pkgs,
  lib,
  username,
  hostName,
  systemInfo,
  ...
}:
with lib;
let
  serverHosts = filter (
    name:
    elem "server" systemInfo.${name}.groups
    && !(elem "iso" systemInfo.${name}.groups)
    && name != hostName
  ) (attrNames systemInfo);

  genCase = name: ''
    ${name} )
      nixos-rebuild switch \
        --flake ~/git/dotfiles#${name} \
        --build-host ${username}@sisyphe.sagbot.com \
        --target-host ${username}@${name}.sagbot.com \
        --sudo \
        --ask-sudo-password
      ;;
  '';
in
{
  home-manager.users.${username} = {
    home.packages = [
      (pkgs.writeShellApplication {
        name = "rebuild";
        text = ''
          case "''${1-}" in
            local )
              nixos-rebuild switch \
                --flake ~/git/dotfiles/ \
                --sudo
              ;;
            ${hostName} )
              nixos-rebuild switch \
                --flake ~/git/dotfiles/ \
                --build-host ${username}@sisyphe.sagbot.com \
                --sudo
              ;;
          ${pkgs.lib.custom.indent 2 (concatStringsSep "" (map genCase serverHosts))}
            * )
              echo "Usage: $0 [local|${hostName}|${concatStringsSep "|" serverHosts}]"
              exit 1
              ;;
          esac
        '';
      })
    ];
  };
}
