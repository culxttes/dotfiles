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
}
