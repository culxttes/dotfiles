{ pkgs, nix-minecraft, ... }:
let
  inherit (nix-minecraft.lib) collectFilesAt;
  modpack = builtins.fetchTarball {
    url = "https://sagbot.com/OceanBlock2.zip";
    sha256 = "17z63kbg01vdlv5h4x7bwp7l23lb3sa9s4vsyrsnmmbspqyjg02j";
  };

  version = "21.1.172";
  installer = builtins.fetchurl {
    url = "https://maven.neoforged.net/releases/net/neoforged/neoforge/${version}/neoforge-${version}-installer.jar";
    sha256 = "155qkrar9yhp58v7h5cigjfiq8091mjpw6j1wn6547f2zy4r7l9z";
  };
  java = "${pkgs.jdk21}/bin/java";
  neoforgeServer = pkgs.writeShellScriptBin "neoforge-server" ''
    if ! [ -e "libraries" ]; then
      echo "Installing NeoForge server..."
      ${java} -jar ${installer} --installServer
    fi
    exec ${java} "$@" @libraries/net/neoforged/neoforge/${version}/unix_args.txt nogui
  '';
in
{
  services.minecraft-servers.servers.oceanblock2 = {
    enable = true;
    autoStart = true;
    restart = "always";

    package = neoforgeServer;

    jvmOpts = "-Xms6G -Xmx10G";

    symlinks = collectFilesAt modpack "mods";
    files =
      collectFilesAt modpack "config"
      // collectFilesAt modpack "defaultconfigs"
      // collectFilesAt modpack "ftbteambases"
      // collectFilesAt modpack "kubejs"
      // collectFilesAt modpack "resourcepacks"
      // collectFilesAt modpack "shaderpacks"
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
