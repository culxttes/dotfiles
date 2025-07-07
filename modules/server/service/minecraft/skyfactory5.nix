{ pkgs, nix-minecraft, ... }:
let
  inherit (nix-minecraft.lib) collectFilesAt;
  modpack = builtins.fetchTarball {
    url = "https://sagbot.com/SkyFactory5Custom.zip";
    sha256 = "091ymb08lb4yfh74zq6sxd0aacvp0qsxcpnshsvqks7vmdzfmmyb";
  };

  version = "1.20.1-47.4.0";
  installer = pkgs.fetchurl {
    pname = "forge-installer";
    inherit version;
    url = "https://maven.minecraftforge.net/net/minecraftforge/forge/${version}/forge-${version}-installer.jar";
    sha256 = "8/V0ZeLL3DKBk/d7p/DJTLZEBfMe1VZ1PZJ16L3Abiw=";
  };
  java = "${pkgs.openjdk17}/bin/java";
  forgeServer = pkgs.writeShellScriptBin "forge-server" ''
    if ! [ -e "libraries" ]; then
      echo "Installing Forge server..."
      ${java} -jar ${installer} --installServer
    fi
    exec ${java} "$@" @libraries/net/minecraftforge/forge/${version}/unix_args.txt nogui
  '';
in
{
  services.minecraft-servers.servers.skyfactory5 = {
    enable = true;
    autoStart = true;
    restart = "always";

    package = forgeServer;

    jvmOpts = "-Xms6G -Xmx10G";

    symlinks = collectFilesAt modpack "mods";
    files =
      collectFilesAt modpack "config"
      // collectFilesAt modpack "world"
      // collectFilesAt modpack "thingpacks"
      // collectFilesAt modpack "scripts"
      // collectFilesAt modpack "journeymap"
      // collectFilesAt modpack "global_packs"
      // collectFilesAt modpack "defaultconfigs"
      // {
        "server-icon.png" = "${modpack}/server-icon.png";
      };

    serverProperties = {
      server-port = 25567;
      "query.port" = 25567;

      spawn-protection = 200;
      enable-command-block = true;
      allow-flight = true;
    };
  };
}
