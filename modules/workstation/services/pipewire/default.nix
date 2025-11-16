{
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    pulse.enable = true;

    wireplumber = {
      enable = true;

      extraConfig = {
        "99-disable-agc.conf" = {
          "monitor.alsa.rules" = [
            {
              "matches" = [
                {
                  "node.name" = "~alsa_input.*";
                }
              ];
              "actions" = {
                "update-props" = {
                  "audio.webrtc.auto-gain-control" = false;
                };
              };
            }
          ];
        };
      };
    };
  };
}
