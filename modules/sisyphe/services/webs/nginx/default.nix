{
  username,
  config,
  lib,
  pkgs,
  ...
}:

{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "sagbot.com" = {
        listen = [
          {
            addr = "127.0.0.80";
            port = 3333;
          }
        ];
        root = "/var/www/www.sagbot.com/public_html";
        extraConfig = ''
          index index.php index.html;
          absolute_redirect off;
        '';
        locations = {
          "~ \\.php$".extraConfig = ''
            fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
            fastcgi_index index.php;
            include ${pkgs.nginx}/conf/fastcgi.conf;
          '';
        };
      };
    };
  };

  users.users.${username}.extraGroups = [
    "nginx"
  ];

  custom.services.haproxy = {
    backends = lib.mapAttrsToList (name: value: {
      inherit name;
      mode = "http";
      servers =
        let
          server = lib.head value.listen;
        in
        [
          {
            name = "server1";
            addr = "${server.addr}:${toString server.port}";
            check = true;
          }
        ];
    }) config.services.nginx.virtualHosts;

    maps.url = [
      {
        url = "sagbot.com";
        backend = "sagbot.com";
      }
    ];
  };
}
