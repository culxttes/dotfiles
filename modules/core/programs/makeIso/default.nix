{
  pkgs,
  lib,
  username,
  systemInfo,
  ...
}:
with lib;
let
  isoHosts = builtins.filter (name: builtins.elem "iso" systemInfo.${name}.groups) (
    builtins.attrNames systemInfo
  );

  genCase = name: ''
    ${name} )
      nix build \
        --builders 'ssh-ng://${username}@sisyphe.sagbot.com x86_64-linux ~/.ssh/${username} 4 1 benchmark,big-parallel,kvm,nixos-test' \
        --max-jobs 0 \
        ~/git/dotfiles#nixosConfigurations.${name}.config.system.build.isoImage       ;;
  '';
in
{
  home-manager.users.${username} = {
    home.packages = [
      (pkgs.writeShellApplication {
        name = "makeIso";
        text = ''
          case "''\${1-}" in
            ${concatStringsSep "" (map genCase isoHosts)}
            * )
              echo "Usage: $0 [${concatStringsSep "|" isoHosts}]"
              exit 1
              ;;
          esac
        '';
      })
    ];
  };
}
