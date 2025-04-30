{ pkgs, ... }:

{
  boot = {
    # Console log level (0 = disabled)
    consoleLogLevel = 0;

    loader = {
      # Enable systemd-boot as the bootloader
      systemd-boot.enable = true;

      # Allow modifying EFI variables
      efi.canTouchEfiVariables = true;

      # Set a timeout of 0 seconds before booting the system
      timeout = 0;
    };

    kernelParams = [
      # Reduce kernel output during boot
      "quiet"

      # Enable graphical boot screen (via Plymouth)
      "splash"

      # Disable automatic USB device suspension
      "usbcore.autosuspend=-1"
    ];

    initrd = {
      # Disable verbose output for the initramfs
      verbose = false;

      # Add the 'setleds' command to the initramfs
      extraUtilsCommands = ''
        copy_bin_and_libs ${pkgs.kbd}/bin/setleds
      '';

      # Run commands before devices are initialized
      # Enable Num Lock on all TTYs
      preDeviceCommands = ''
        INITTY=/dev/tty[1-6]
        for tty in $INITTY; do
          /bin/setleds -D +num < $tty
        done
      '';
    };

    plymouth = {
      # Enable Plymouth for graphical boot splash
      enable = true;

      # Set the Plymouth theme to "rings"
      theme = "rings";

      # Install the selected Plymouth theme
      themePackages = with pkgs;
        [
          (adi1090x-plymouth-themes.override { selected_themes = [ "rings" ]; })
        ];
    };
  };
}
