{
  config,
  pkgs,
  ...
}:
let
  haproxy_minecraft = pkgs.stdenv.mkDerivation {
    pname = "haproxy_minecraft-patch";
    version = "1.0";

    src = builtins.fetchurl {
      url = "https://gist.githubusercontent.com/nathan818fr/a078e92604784ad56e84843ebf99e2e5/raw/3d9c74eec578aa0c0a177369d7106fe224b03efd/haproxy_minecraft.lua";
      sha256 = "0krznqcq1v7vqz473gyy1cbhgwpj9s7xbzzfqg4llrzdvpk6xrzp";
    };

    patches = [
      ./assets/haproxy_minecraft.patch
    ];

    unpackPhase = ''
      cp $src haproxy_minecraft.lua
    '';

    patchPhase = ''
      patch -p0 < ${./assets/haproxy_minecraft.patch}
    '';

    installPhase = ''
      mkdir -p $out
      cp haproxy_minecraft.lua $out/
    '';
  };
in
{
  imports = [
    # keep-sorted start
    ./nixos-module.nix
    # keep-sorted end
  ];

  custom.services.haproxy = {
    enable = true;

    global = {
      maxconn = 4000;
      daemon = true;

      extraConfig = ''
        ssl-default-bind-options ssl-min-ver TLSv1.2 
        ssl-default-bind-ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384

        tune.lua.bool-sample-conversion normal
        lua-load ${haproxy_minecraft}/haproxy_minecraft.lua
      '';
    };

    defaults = {
      maxconn = 4000;

      extraConfig = ''
        log                     global
        option                  dontlognull
        option                  redispatch
        retries                 3
        timeout http-request    10s
        timeout queue           1m
        timeout connect         10s
        timeout client          1m
        timeout server          1m
        timeout http-keep-alive 10s
        timeout check           10s
      '';
    };

    defaultBackend = "sagbot.com";

    backends = [
      {
        name = "sagbot.com";
        mode = "http";
        servers = [
          {
            name = "server1";
            addr = "127.0.0.80:3333";
            check = true;
          }
        ];
      }
      {
        name = "mail.sagbot.com";
        mode = "http";
        servers = [
          {
            name = "server1";
            addr = "127.0.0.25:3380";
            check = true;
          }
        ];
      }
      {
        name = "api.sagbot.com.sagedt";
        mode = "http";
        servers = [
          {
            name = "server1";
            addr = "127.0.0.3:11593";
            check = true;
          }
        ];
        extraConfig = "http-request set-path %[path,regsub(^/sagedt/?,/)]";
      }
      {
        name = "atacc";
        mode = "http";
        servers = [
          {
            name = "server1";
            addr = "127.0.0.1:3456";
            check = true;
          }
        ];
      }
      {
        name = "pass.sagbot.com";
        mode = "http";
        servers = [
          {
            name = "server1";
            addr = "127.0.0.1:8222";
            check = true;
          }
        ];
      }
      {
        name = "stats.sagbot.com";
        mode = "http";
        servers = [
          {
            name = "server1";
            addr = "127.0.0.27:2701";
            check = true;
          }
        ];
      }
      {
        name = "neo4j.sagbot.com";
        mode = "http";
        servers = [
          {
            name = "server1";
            addr = config.services.neo4j.http.listenAddress;
            check = true;
          }
        ];
      }
      {
        name = "auth.sagbot.com";
        mode = "http";
        servers =
          let
            inherit (config.services.keycloak.settings) http-host http-port;
          in
          [

            {
              name = "server1";
              addr = "${http-host}:${toString http-port}";
              check = true;
            }
          ];
      }
    ];

    frontends = [
      {
        name = "local_stats";
        bind = "127.0.0.84:8404";
        mode = "http";
        extraConfig = "http-request use-service prometheus-exporter";
      }
    ];

    maps = {
      url = [
        {
          url = "sagbot.com";
          backend = "sagbot.com";
        }
        {
          url = "mail.sagbot.com";
          backend = "mail.sagbot.com";
        }
        {
          url = "api.sagbot.com/sagedt";
          backend = "api.sagbot.com.sagedt";
        }
        {
          url = "atacc.sagbot.com";
          backend = "atacc";
        }
        {
          url = "atacc-edu.org";
          backend = "atacc";
        }
        {
          url = "pass.sagbot.com";
          backend = "pass.sagbot.com";
        }
        {
          url = "stats.sagbot.com";
          backend = "stats.sagbot.com";
        }
        {
          url = config.services.neo4j.http.advertisedAddress;
          backend = "neo4j.sagbot.com";
        }
        {
          url = "auth.sagbot.com";
          backend = "auth.sagbot.com";
        }
      ];

      minecraft = [ ];
    };

    extraConfig = ''

    '';
  };
}
