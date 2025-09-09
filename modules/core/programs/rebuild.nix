{
  pkgs,
  lib,
  username,
  systemInfo,
  ...
}:

let
  serverHosts =
    let
      names = builtins.attrNames systemInfo;
    in
    builtins.filter (name: builtins.elem "server" systemInfo.${name}.groups) names;

  genCase = name: ''
    ${name} )
      nixos-rebuild switch \
        --flake ~/git/dotfiles#${name} \
        --build-host ${username}@${name}.sagbot.com \
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
          case "''\${1-}" in
            "" )
              nixos-rebuild switch \
                --flake ~/git/dotfiles/ \
                --sudo
              ;;
            remote )
              nixos-rebuild switch \
                --flake ~/git/dotfiles/ \
                --build-host ${username}@sisyphe.sagbot.com \
                --sudo
              ;;
            ${lib.concatStringsSep "" (map genCase serverHosts)}
            * )
              echo "Usage: $0 [remote|${lib.concatStringsSep "|" serverHosts}]"
              exit 1
              ;;
          esac
        '';
      })
    ];
  };
}
