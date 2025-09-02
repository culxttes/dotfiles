{ pkgs, ... }:
let
  lockScript = pkgs.writeShellScript "lock-all-sessions" ''
    if [ -f /tmp/no-lock ]; then
      exit 0
    fi

    for session in $(${pkgs.systemd}/bin/loginctl list-sessions --no-legend | ${pkgs.gawk}/bin/awk '$2 != "root" {print $1}'); do
      ${pkgs.systemd}/bin/loginctl lock-session "$session"
    done
  '';
in
{
  services.udev.extraRules = ''
    ACTION=="remove", ATTRS{idVendor}=="1050", ATTRS{idProduct}=="0407", RUN+="${lockScript}"
  '';
}
