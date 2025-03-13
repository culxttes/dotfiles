# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
  

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 
  # Magic command to enable Numlock at startup for all tty
  boot.initrd.extraUtilsCommands = ''
    copy_bin_and_libs ${pkgs.kbd}/bin/setleds
  '';
  boot.initrd.preDeviceCommands = ''
    INITTY=/dev/tty[1-6]
    for tty in $INITTY; do
      /bin/setleds -D +num < $tty
    done
  '';

  # To resolve a bug with my usb port
  boot.kernelParams = [ "usbcore.autosuspend=-1" ];

  networking.hostName = "tantale"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  nixpkgs.overlays = [ inputs.hyprpanel.overlay ];

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.culottes = {
    isNormalUser = true;
    description = "culottes";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Listpackages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     # Web request
     curl
     wget
     # System Monitoring
     btop
     # SDDM Theme
     (catppuccin-sddm.override {
       flavor = "mocha";
     })
  ];

  fonts = {
    packages = [
      pkgs.nerd-fonts.hack
      pkgs.nerd-fonts.noto
      pkgs.nerd-fonts._3270
      pkgs.nerd-fonts.lilex
      pkgs.nerd-fonts.agave
      pkgs.nerd-fonts.mplus
      pkgs.nerd-fonts.arimo
      pkgs.nerd-fonts.tinos
      pkgs.nerd-fonts.hurmit
      pkgs.nerd-fonts.monoid
      pkgs.nerd-fonts.ubuntu
      pkgs.nerd-fonts.lekton
      pkgs.nerd-fonts.go-mono
      pkgs.nerd-fonts.iosevka
      pkgs.nerd-fonts.hasklug
      pkgs.nerd-fonts.profont
      pkgs.nerd-fonts.monofur
      pkgs.nerd-fonts.cousine
      pkgs.nerd-fonts.mononoki
      pkgs.nerd-fonts.overpass
      pkgs.nerd-fonts._0xproto
      pkgs.nerd-fonts.gohufont
      pkgs.nerd-fonts.zed-mono
      pkgs.nerd-fonts.d2coding
      pkgs.nerd-fonts.meslo-lg
      pkgs.nerd-fonts.anonymice
      pkgs.nerd-fonts.monaspace
      pkgs.nerd-fonts.fira-code
      pkgs.nerd-fonts.fira-mono
      pkgs.nerd-fonts.blex-mono
      pkgs.nerd-fonts.geist-mono
      pkgs.nerd-fonts.heavy-data
      pkgs.nerd-fonts.im-writing
      pkgs.nerd-fonts.liberation
      pkgs.nerd-fonts.space-mono
      pkgs.nerd-fonts.inconsolata
      pkgs.nerd-fonts.commit-mono
      pkgs.nerd-fonts.intone-mono
      pkgs.nerd-fonts.ubuntu-mono
      pkgs.nerd-fonts.ubuntu-sans
      pkgs.nerd-fonts.envy-code-r
      pkgs.nerd-fonts.roboto-mono
      pkgs.nerd-fonts.victor-mono
      pkgs.nerd-fonts.iosevka-term
      pkgs.nerd-fonts.martian-mono
      pkgs.nerd-fonts.symbols-only
      pkgs.nerd-fonts.terminess-ttf
      pkgs.nerd-fonts.open-dyslexic
      pkgs.nerd-fonts.sauce-code-pro
      pkgs.nerd-fonts.caskaydia-cove
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.code-new-roman
      pkgs.nerd-fonts.inconsolata-go
      pkgs.nerd-fonts.recursive-mono
      pkgs.nerd-fonts.departure-mono
      pkgs.nerd-fonts.caskaydia-mono
      pkgs.nerd-fonts.inconsolata-lgc
      pkgs.nerd-fonts.shure-tech-mono
      pkgs.nerd-fonts.proggy-clean-tt
      pkgs.nerd-fonts.daddy-time-mono
      pkgs.nerd-fonts.droid-sans-mono
      pkgs.nerd-fonts.dejavu-sans-mono
      pkgs.nerd-fonts.bigblue-terminal
      pkgs.nerd-fonts.iosevka-term-slab
      pkgs.nerd-fonts.comic-shanns-mono
      pkgs.nerd-fonts.aurulent-sans-mono
      pkgs.nerd-fonts.fantasque-sans-mono
      pkgs.nerd-fonts.bitstream-vera-sans-mono
    ];
    fontDir.enable = true;
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.zsh = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.nix-ld.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # List services that you want to enable:
  
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

  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.pcscd.enable = true;
  hardware.gpgSmartcards.enable = true;

  programs.gnupg.agent = {
    enable = true;
  };

  security.pam = {
    u2f = {
      settings = {
        cue = true;
      };
      control = "required";
    };
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
      hyprlock.u2fAuth = true;
    };
  };

  services.upower = {
    enable = true;
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
