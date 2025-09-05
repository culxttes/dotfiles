{ pkgs, ... }:
let
  lockScript = pkgs.writeShellApplication {
    name = "lock-all-sessions";

    runtimeInputs = with pkgs; [
      jq
      systemd
      custom.is-ctrl-pressed
    ];

    text = ''
      if is-ctrl-pressed; then
        exit 0
      fi

      for session in $(loginctl list-sessions -j | jq -r '.[] | select(.user != "root") | .session'); do
        loginctl lock-session "$session"
      done
    '';
  };
in
{
  nixpkgs.overlays = [
    (import ./overlay.nix)
  ];

  services.udev.extraRules = ''
    ACTION=="remove", ATTRS{idVendor}=="1050", ATTRS{idProduct}=="0407", RUN+="${lockScript}/bin/lock-all-sessions"
  '';
}
