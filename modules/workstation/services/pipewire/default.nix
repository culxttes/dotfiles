{
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
    wireplumber.enable = true;

    extraConfig.pipewire = {
      "10-disable-volume-limiting" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
        };
        "stream.properties" = {
          "channelmix.normalize" = false;
        };
      };
    };
  };
}
