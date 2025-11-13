{ config, ... }:

{
  services.grafana = {
    enable = true;

    settings = {
      server = {
        http_addr = "127.0.0.27";
        http_port = 2701;
        domain = "stats.sagbot.com";
      };
    };

    provision = {
      datasources = {
        settings = {
          datasources = [
            {
              name = "Prometheus";
              type = "Prometheus";
              url = "http://localhost:${toString config.services.prometheus.port}";
            }
          ];
        };
      };
    };
  };

  custom.services.haproxy = {
    backends = [
      {
        name = "grafana";
        mode = "http";
        servers =
          let
            inherit (config.services.grafana.settings) server;
          in
          [
            {
              name = "server1";
              addr = "${server.http_addr}:${toString server.http_port}";
              check = true;
            }
          ];
      }
    ];

    maps = {
      url =
        let
          inherit (config.services.grafana.settings) server;
        in
        [
          {
            url = server.domain;
            backend = "grafana";
          }
        ];
    };
  };
}
