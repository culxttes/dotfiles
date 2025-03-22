# dotfiles

This repository contains various configuration files and binaries from my
computer setup. It's a collection of personal dotfiles aimed to streamline the
setup of my development environment.

## Tree

```
.
├── flake.lock
├── flake.nix
├── hosts
│   ├── common
│   │   ├── boot.nix
│   │   ├── default.nix
│   │   └── locale.nix
│   ├── default.nix
│   └── tantale
│       ├── default.nix
│       ├── hardware-configuration.nix
│       └── hardware-specific.nix
├── LICENSE
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
│   │   ├── default.nix
│   │   ├── network
│   │   │   └── default.nix
│   │   ├── nix
│   │   │   ├── default.nix
│   │   │   └── settings.nix
│   │   ├── programs
│   │   │   ├── default.nix
│   │   │   ├── monitoring
│   │   │   │   ├── btop.nix
│   │   │   │   ├── default.nix
│   │   │   │   └── fastfetch.nix
│   │   │   └── utils
│   │   │       ├── default.nix
│   │   │       └── tree.nix
│   │   ├── runtime
│   │   │   ├── appimage.nix
│   │   │   ├── default.nix
│   │   │   └── nix-ld.nix
│   │   └── service
│   │       ├── default.nix
│   │       ├── displayManager.nix
│   │       └── upower.nix
│   ├── default.nix
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
│   │   ├── default.nix
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
│   │   └── tui
│   │       ├── default.nix
│   │       └── nvim
│   │           ├── config
│   │           │   ├── init.lua
│   │           │   ├── lazy-lock.json
│   │           │   ├── LICENSE
│   │           │   ├── ltex_config.lua
│   │           │   ├── lua
│   │           │   │   ├── chadrc.lua
│   │           │   │   ├── configs
│   │           │   │   │   ├── conform.lua
│   │           │   │   │   ├── lazy.lua
│   │           │   │   │   └── lspconfig.lua
│   │           │   │   ├── mappings.lua
│   │           │   │   ├── options.lua
│   │           │   │   └── plugins
│   │           │   │       ├── init.lua
│   │           │   │       ├── nvim-dap.lua
│   │           │   │       ├── rustaceanvim.lua
│   │           │   │       ├── rust.lua
│   │           │   │       ├── treesitter.lua
│   │           │   │       ├── vimtex.lua
│   │           │   │       └── virt-column.lua
│   │           │   └── README.md
│   │           └── default.nix
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
│   │   ├── default.nix
│   │   ├── pam.nix
│   │   └── yubikey
│   │       ├── assets
│   │       │   └── u2f_keys
│   │       └── default.nix
│   └── shell
│       ├── default.nix
│       ├── kitty.nix
│       ├── oh-my-posh.nix
│       └── zsh.nix
├── profiles
│   ├── default.nix
│   └── desktop.nix
├── README.md
└── users
    ├── culottes
    │   └── default.nix
    └── default.nix
```

## License

This project is licensed under the Unlicense.
