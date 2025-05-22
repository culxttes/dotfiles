{ pkgs, username, ... }:

{
  programs.adb.enable = true;

  users.users.${username}.extraGroups = [
    "adbusers"
  ];

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      droidcam-obs
    ];
  };
}
