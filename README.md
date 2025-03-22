<!--- LTeX: language=en-US --->

# dotfiles

This repository contains various configuration files and binaries from my
computer setup. It's a collection of personal dotfiles aimed to streamline the
setup of my development environment.

## Tree

```
.
├── hosts
│   ├── common
│   │   ├── boot.nix
│   │   ├── default.nix
│   │   └── locale.nix
│   ├── tantale
│   │   ├── default.nix
│   │   ├── hardware-configuration.nix
│   │   └── hardware-specific.nix
│   └── default.nix
├── modules
│   ├── config
│   │   ├── default.nix
│   │   └── font.nix
│   ├── core
│   │   ├── agent
│   │   │   ├── default.nix
│   │   │   ├── gpg-agent.nix
│   │   │   └── ssh-agent.nix
│   │   ├── bluetooth
│   │   │   └── default.nix
│   │   ├── network
│   │   │   └── default.nix
│   │   ├── nix
│   │   │   ├── default.nix
│   │   │   └── settings.nix
│   │   ├── programs
│   │   │   ├── monitoring
│   │   │   │   ├── btop.nix
│   │   │   │   ├── default.nix
│   │   │   │   └── fastfetch.nix
│   │   │   ├── utils
│   │   │   │   ├── default.nix
│   │   │   │   └── tree.nix
│   │   │   └── default.nix
│   │   ├── runtime
│   │   │   ├── appimage.nix
│   │   │   ├── default.nix
│   │   │   └── nix-ld.nix
│   │   ├── service
│   │   │   ├── default.nix
│   │   │   ├── displayManager.nix
│   │   │   └── upower.nix
│   │   └── default.nix
│   ├── desktop
│   │   ├── cli
│   │   │   ├── default.nix
│   │   │   ├── ffmpeg.nix
│   │   │   ├── git.nix
│   │   │   ├── gpg.nix
│   │   │   ├── gzip.nix
│   │   │   ├── imagemagick.nix
│   │   │   ├── jq.nix
│   │   │   ├── ssh.nix
│   │   │   ├── unzip.nix
│   │   │   └── wl-mirror.nix
│   │   ├── gtk
│   │   │   └── default.nix
│   │   ├── gui
│   │   │   ├── default.nix
│   │   │   ├── discord.nix
│   │   │   ├── firefox.nix
│   │   │   ├── galculator.nix
│   │   │   ├── idea.nix
│   │   │   ├── networkmanagerapplet.nix
│   │   │   ├── noi.nix
│   │   │   ├── vscode.nix
│   │   │   └── zathura.nix
│   │   ├── hypr
│   │   │   ├── assets
│   │   │   │   ├── background.jpg
│   │   │   │   └── logo.jpg
│   │   │   ├── default.nix
│   │   │   ├── hypridle.nix
│   │   │   ├── hyprland.nix
│   │   │   ├── hyprlock.nix
│   │   │   ├── hyprpanel.nix
│   │   │   └── hyprpaper.nix
│   │   ├── rofi
│   │   │   ├── assets
│   │   │   │   └── rofi.jpg
│   │   │   └── default.nix
│   │   ├── tui
│   │   │   ├── nvim
│   │   │   │   ├── config
│   │   │   │   │   ├── lua
│   │   │   │   │   │   ├── configs
│   │   │   │   │   │   │   ├── conform.lua
│   │   │   │   │   │   │   ├── lazy.lua
│   │   │   │   │   │   │   └── lspconfig.lua
│   │   │   │   │   │   ├── plugins
│   │   │   │   │   │   │   ├── init.lua
│   │   │   │   │   │   │   ├── nvim-dap.lua
│   │   │   │   │   │   │   ├── rustaceanvim.lua
│   │   │   │   │   │   │   ├── rust.lua
│   │   │   │   │   │   │   ├── treesitter.lua
│   │   │   │   │   │   │   ├── vimtex.lua
│   │   │   │   │   │   │   └── virt-column.lua
│   │   │   │   │   │   ├── chadrc.lua
│   │   │   │   │   │   ├── mappings.lua
│   │   │   │   │   │   └── options.lua
│   │   │   │   │   ├── init.lua
│   │   │   │   │   ├── lazy-lock.json
│   │   │   │   │   ├── LICENSE
│   │   │   │   │   ├── ltex_config.lua
│   │   │   │   │   └── README.md
│   │   │   │   └── default.nix
│   │   │   └── default.nix
│   │   └── default.nix
│   ├── languages
│   │   ├── c
│   │   │   ├── assets
│   │   │   └── default.nix
│   │   ├── default.nix
│   │   ├── java.nix
│   │   ├── javascript.nix
│   │   ├── latex.nix
│   │   ├── rust.nix
│   │   └── scala.nix
│   ├── security
│   │   ├── yubikey
│   │   │   ├── assets
│   │   │   │   └── u2f_keys
│   │   │   └── default.nix
│   │   ├── default.nix
│   │   └── pam.nix
│   ├── shell
│   │   ├── default.nix
│   │   ├── kitty.nix
│   │   ├── oh-my-posh.nix
│   │   └── zsh.nix
│   └── default.nix
├── profiles
│   ├── default.nix
│   └── desktop.nix
├── users
│   ├── culottes
│   │   └── default.nix
│   └── default.nix
├── flake.lock
├── flake.nix
├── LICENSE
└── README.md
```

## License

This project is licensed under the Unlicense.
