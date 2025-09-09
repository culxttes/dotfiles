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
  };
}
