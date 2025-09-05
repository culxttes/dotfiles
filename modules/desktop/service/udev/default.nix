{ pkgs, username, ... }:
let
  lockScript = pkgs.writeShellScript "lock-all-sessions" ''
    if ${pkgs.custom.is-ctrl-pressed}/bin/is-ctrl-pressed; then
      exit 0
    fi

    for session in $(${pkgs.systemd}/bin/loginctl list-sessions --no-legend | ${pkgs.gawk}/bin/awk '$2 != "root" {print $1}'); do
      ${pkgs.systemd}/bin/loginctl lock-session "$session"
    done
  '';
in
{
  nixpkgs.overlays = [
    (import ./overlay.nix)
  ];

  services.udev.extraRules = ''
    ACTION=="remove", ATTRS{idVendor}=="1050", ATTRS{idProduct}=="0407", RUN+="${lockScript}"
  '';
}
