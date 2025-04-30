{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     (catppuccin-sddm.override {
       flavor = "mocha";
     })
  ];

  services.displayManager = {
    enable = true;
    sddm = {
      enable = true;
      theme = "catppuccin-mocha";
      # Don't work somehow
      autoNumlock = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_DRM_NO_ATOMIC = "1";
  };
}
