{ pkgs, ... }:

{
  fonts = {
    # List of fonts to be installed
    packages = [
      pkgs.nerd-fonts.hack                     # Hack Nerd Font
      pkgs.nerd-fonts.noto                     # Noto Nerd Font
      pkgs.nerd-fonts._3270                    # IBM 3270 Nerd Font
      pkgs.nerd-fonts.lilex                    # Lilex Nerd Font
      pkgs.nerd-fonts.agave                    # Agave Nerd Font
      pkgs.nerd-fonts.mplus                    # M+ Nerd Font
      pkgs.nerd-fonts.arimo                    # Arimo Nerd Font
      pkgs.nerd-fonts.tinos                    # Tinos Nerd Font
      pkgs.nerd-fonts.hurmit                   # Hurmit Nerd Font
      pkgs.nerd-fonts.monoid                   # Monoid Nerd Font
      pkgs.nerd-fonts.ubuntu                   # Ubuntu Nerd Font
      pkgs.nerd-fonts.lekton                   # Lekton Nerd Font
      pkgs.nerd-fonts.go-mono                  # Go Mono Nerd Font
      pkgs.nerd-fonts.iosevka                  # Iosevka Nerd Font
      pkgs.nerd-fonts.hasklug                  # Hasklig Nerd Font
      pkgs.nerd-fonts.profont                  # ProFont Nerd Font
      pkgs.nerd-fonts.monofur                  # Monofur Nerd Font
      pkgs.nerd-fonts.cousine                  # Cousine Nerd Font
      pkgs.nerd-fonts.mononoki                 # Mononoki Nerd Font
      pkgs.nerd-fonts.overpass                 # Overpass Nerd Font
      pkgs.nerd-fonts._0xproto                 # 0xProto Nerd Font
      pkgs.nerd-fonts.gohufont                 # GohuFont Nerd Font
      pkgs.nerd-fonts.zed-mono                 # Zed Mono Nerd Font
      pkgs.nerd-fonts.d2coding                 # D2Coding Nerd Font
      pkgs.nerd-fonts.meslo-lg                 # Meslo LG Nerd Font
      pkgs.nerd-fonts.anonymice                # Anonymice Nerd Font
      pkgs.nerd-fonts.monaspace                # Monaspace Nerd Font
      pkgs.nerd-fonts.fira-code                # Fira Code Nerd Font
      pkgs.nerd-fonts.fira-mono                # Fira Mono Nerd Font
      pkgs.nerd-fonts.blex-mono                # Blex Mono Nerd Font
      pkgs.nerd-fonts.geist-mono               # Geist Mono Nerd Font
      pkgs.nerd-fonts.heavy-data               # Heavy Data Nerd Font
      pkgs.nerd-fonts.im-writing               # I’m Writing Nerd Font
      pkgs.nerd-fonts.liberation               # Liberation Nerd Font
      pkgs.nerd-fonts.space-mono               # Space Mono Nerd Font
      pkgs.nerd-fonts.inconsolata              # Inconsolata Nerd Font
      pkgs.nerd-fonts.commit-mono              # Commit Mono Nerd Font
      pkgs.nerd-fonts.intone-mono              # Intone Mono Nerd Font
      pkgs.nerd-fonts.ubuntu-mono              # Ubuntu Mono Nerd Font
      pkgs.nerd-fonts.ubuntu-sans              # Ubuntu Sans Nerd Font
      pkgs.nerd-fonts.envy-code-r              # Envy Code R Nerd Font
      pkgs.nerd-fonts.roboto-mono              # Roboto Mono Nerd Font
      pkgs.nerd-fonts.victor-mono              # Victor Mono Nerd Font
      pkgs.nerd-fonts.iosevka-term             # Iosevka Term Nerd Font
      pkgs.nerd-fonts.martian-mono             # Martian Mono Nerd Font
      pkgs.nerd-fonts.symbols-only             # Symbols Only Nerd Font
      pkgs.nerd-fonts.terminess-ttf            # Terminess TTF Nerd Font
      pkgs.nerd-fonts.open-dyslexic            # Open Dyslexic Nerd Font
      pkgs.nerd-fonts.sauce-code-pro           # Sauce Code Pro Nerd Font
      pkgs.nerd-fonts.caskaydia-cove           # Caskaydia Cove Nerd Font
      pkgs.nerd-fonts.jetbrains-mono           # JetBrains Mono Nerd Font
      pkgs.nerd-fonts.code-new-roman           # Code New Roman Nerd Font
      pkgs.nerd-fonts.inconsolata-go           # Inconsolata Go Nerd Font
      pkgs.nerd-fonts.recursive-mono           # Recursive Mono Nerd Font
      pkgs.nerd-fonts.departure-mono           # Departure Mono Nerd Font
      pkgs.nerd-fonts.caskaydia-mono           # Caskaydia Mono Nerd Font
      pkgs.nerd-fonts.inconsolata-lgc          # Inconsolata LGC Nerd Font
      pkgs.nerd-fonts.shure-tech-mono          # Shure Tech Mono Nerd Font
      pkgs.nerd-fonts.proggy-clean-tt          # Proggy Clean TTF Nerd Font
      pkgs.nerd-fonts.daddy-time-mono          # Daddy Time Mono Nerd Font
      pkgs.nerd-fonts.droid-sans-mono          # Droid Sans Mono Nerd Font
      pkgs.nerd-fonts.dejavu-sans-mono         # DejaVu Sans Mono Nerd Font
      pkgs.nerd-fonts.bigblue-terminal         # BigBlue Terminal Nerd Font
      pkgs.nerd-fonts.iosevka-term-slab        # Iosevka Term Slab Nerd Font
      pkgs.nerd-fonts.comic-shanns-mono        # Comic Shanns Mono Nerd Font
      pkgs.nerd-fonts.aurulent-sans-mono       # Aurulent Sans Mono Nerd Font
      pkgs.nerd-fonts.fantasque-sans-mono      # Fantasque Sans Mono Nerd Font
      pkgs.nerd-fonts.bitstream-vera-sans-mono # Bitstream Vera Sans Mono Nerd Font

      pkgs.jetbrains-mono                      # JetBrains Mono Font
    ];

    # Enable the system-wide font directory
    fontDir.enable = true;
  };
}

