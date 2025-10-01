{
  pkgs,
  lib,
  username,
  systemInfo,
  ...
}:
with lib;
let
  serverHosts = builtins.filter (name: builtins.elem "server" systemInfo.${name}.groups) (
    builtins.attrNames systemInfo
  );

  genCase = name: ''
    ${name} )
      nixos-rebuild switch \
        --flake ~/git/dotfiles#${name} \
        --build-host ${username}@sisyphe.sagbot.com \
        --target-host ${username}@${name}.sagbot.com \
        --sudo \
        --ask-sudo-password \
        --log-format internal-json \
        --verbose \
      |& nom --json
      ;;
  '';
in
{
  home-manager.users.${username} = {
    home.packages = [
      (pkgs.writeShellApplication {
        name = "rebuild";
        text = ''
          case "''\${1-}" in
            "" )
              nixos-rebuild switch \
                --flake ~/git/dotfiles/ \
                --sudo \
                --log-format internal-json \
                --verbose \
              |& nom --json
              ;;
            remote )
              nixos-rebuild switch \
                --flake ~/git/dotfiles/ \
                --build-host ${username}@sisyphe.sagbot.com \
                --sudo \
                --log-format internal-json \
                --verbose \
              |& nom --json
              ;;
            ${concatStringsSep "" (map genCase serverHosts)}
            * )
              echo "Usage: $0 [remote|${concatStringsSep "|" serverHosts}]"
              exit 1
              ;;
          esac
        '';
      })
    ];
  };
}
