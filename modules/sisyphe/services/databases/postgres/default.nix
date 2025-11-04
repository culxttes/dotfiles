{ pkgs, config, ... }:

{
  imports = [
    # keep-sorted start
    ./secrets
    # keep-sorted end
  ];

  services.postgresql = {
    enable = true;

    initialScript = config.sops.secrets."postgres/initialScript".path;

    authentication = pkgs.lib.mkOverride 10 ''
      # TYPE      DATABASE      USER      ADDRESS       METHOD
        local     all           postgres                peer map=superuser_map
        local     all           all                     scram-sha-256
    '';

    identMap = ''
      # ArbitraryMapName systemUser DBUser
      superuser_map      root      postgres
      superuser_map      postgres  postgres
    '';
  };
}
