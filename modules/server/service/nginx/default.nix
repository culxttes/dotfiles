{ username, ... }:

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

  users.users.culottes.extraGroups = [
    "nginx"
  ];
}
