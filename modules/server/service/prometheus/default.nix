{
  services.prometheus = {
    enable = true;
    scrapeConfigs = [
      {
        job_name = "haproxy";
        static_configs = [
          {
            targets = [ "127.0.0.84:8404" ];
          }
        ];
      }
    ];
  };
}
