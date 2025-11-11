let
  addr = "127.0.0.84:8404";
in
{
  services.prometheus = {
    enable = true;
    scrapeConfigs = [
      {
        job_name = "haproxy";
        static_configs = [
          {
            targets = [
              addr
            ];
          }
        ];
      }
    ];
  };

  custom.services.haproxy.frontends = [
    {
      name = "local_stats";
      bind = addr;
      mode = "http";
      extraConfig = "http-request use-service prometheus-exporter";
    }
  ];
}
