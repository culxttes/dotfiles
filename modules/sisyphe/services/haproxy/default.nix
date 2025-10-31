{ config, pkgs, ... }:
let
  haproxy_minecraft = pkgs.stdenv.mkDerivation {
    pname = "haproxy_minecraft-patch";
    version = "1.0";

    src = builtins.fetchurl {
      url = "https://gist.githubusercontent.com/nathan818fr/a078e92604784ad56e84843ebf99e2e5/raw/3d9c74eec578aa0c0a177369d7106fe224b03efd/haproxy_minecraft.lua";
      sha256 = "0krznqcq1v7vqz473gyy1cbhgwpj9s7xbzzfqg4llrzdvpk6xrzp";
    };

    patches = [ ./assets/haproxy_minecraft.patch ];

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
  services.haproxy = {
    enable = true;
    config = ''
      global
        user haproxy
        group haproxy
        maxconn 4000
        daemon

        ssl-default-bind-options ssl-min-ver TLSv1.2 
        ssl-default-bind-ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384

        tune.lua.bool-sample-conversion normal
        lua-load ${haproxy_minecraft}/haproxy_minecraft.lua

      defaults
        log     global
        option  dontlognull
        option                  redispatch
        retries                 3
        timeout http-request    10s
        timeout queue           1m
        timeout connect         10s
        timeout client          1m
        timeout server          1m
        timeout http-keep-alive 10s
        timeout check           10s
        maxconn                 3000

      backend close_connection
        mode tcp
        timeout connect 1ms
        timeout server 1ms
        tcp-request content reject

      frontend http-in
        bind :::80 v4v6
        mode http
        redirect scheme https code 301 if !{ ssl_fc }

      frontend https-in
        bind :::443 v4v6 ssl crt-list /etc/haproxy/domain.map
        mode http
        option http-server-close
        option forwardfor
        http-request set-header X-Forwarded-Proto https if { ssl_fc }
        http-response set-header Strict-Transport-Security "max-age=16000000; includeSubDomains; preload;"

        use_backend %[base,map_beg(/etc/haproxy/http.map,backend_www.sagbot.com)]

      frontend local_stats
        bind 127.0.0.84:8404
        mode http
        http-request use-service prometheus-exporter

      frontend minecraft
        bind :::25565 v4v6
        mode tcp

        tcp-request inspect-delay 1s
        tcp-request content lua.mc_handshake
        tcp-request content reject if { var(txn.mc_proto) -m int 0 }
        tcp-request content accept if { var(txn.mc_proto) -m found }
        tcp-request content reject if WAIT_END

        use_backend %[var(txn.mc_host),map_beg(/etc/haproxy/minecraft.map,close_connection)]

      backend backend_www.sagbot.com
        mode http
        server server1 127.0.0.80:3333 check

      backend backend_mail.sagbot.com
        mode http
        server server1 127.0.0.25:3380 check

      backend backend_api.sagbot.com.sagedt
        mode http
        http-request set-path %[path,regsub(^/sagedt/?,/)]
        server server1 127.0.0.3:11593 check

      backend backend_atacc
        mode http
        server server1 127.0.0.1:3456 check

      backend backend_vaultwarden
        mode http
        server server1 127.0.0.1:8222 check

      backend backend_ollama
        mode http
        timeout server          60m
        http-request set-header Host localhost:11434
        server server1 127.0.0.1:11434 check

      backend backend_webui_ollama
        mode http
        server server1 127.0.0.208:3380 check
        http-request set-header Host localhost:3380

      backend backend_stats
        mode http
        server server1 127.0.0.27:2701 check

      backend backend_neo4j
        mode http
        server server1 ${config.services.neo4j.http.listenAddress} check
      backend backend_hermux
        mode http
        server server1 ${config.services.hermux.listen.address}:${toString config.services.hermux.listen.port} check
    '';
  };

  systemd.tmpfiles.settings = {
    haproxy = {
      "/run/haproxy".d = {
        group = "haproxy";
        mode = "0755";
        user = "haproxy";
      };
    };
  };

  environment.etc = {
    "haproxy/http.map" = {
      text = ''
        sagbot.com/ backend_www.sagbot.com
        mail.sagbot.com/ backend_mail.sagbot.com
        api.sagbot.com/sagedt backend_api.sagbot.com.sagedt
        atacc.sagbot.com backend_atacc
        atacc-edu.org backend_atacc
        pass.sagbot.com backend_vaultwarden
        ollama.sagbot.com backend_ollama
        ai.sagbot.com backend_webui_ollama
        stats.sagbot.com backend_stats
        ${config.services.neo4j.http.advertisedAddress} backend_neo4j
        openrouter.sagbot.com backend_hermux
      '';
    };

    "haproxy/minecraft.map" = {
      text = '''';
    };

    "haproxy/domain.map" = {
      text = ''
        /var/lib/acme/sagbot/full.pem
        /var/lib/acme/atacc/full.pem
        /var/lib/acme/culottes/full.pem
        /var/lib/acme/c2fc2f/full.pem
      '';
    };
  };

  users.groups.acme.members = [
    "haproxy"
  ];

  networking.firewall.allowedTCPPorts = [
    80
    443

    25565
  ];
}
