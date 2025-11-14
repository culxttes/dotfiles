{ config, ... }:

{
  imports = [
    # keep-sorted start
    ./secrets
    # keep-sorted end
  ];

  services.grafana = {
    enable = true;

    settings = {
      server = rec {
        http_addr = "127.0.0.27";
        http_port = 2701;
        domain = "stats.sagbot.com";
        root_url = "https://${domain}/";
      };

      auth = {
        disable_login_form = true;
        oauth_auto_login = true;
      };

      "auth.generic_oauth" =
        let
          inherit (config.services.keycloak.settings) hostname;
          client_id = "grafana-oauth";
          roles = "resource_access.\"${client_id}\".roles[*]";
        in
        {
          enabled = true;
          name = "Keycloak-OAuth";
          allow_sign_up = true;
          inherit client_id;
          client_secret = "$__file{${config.sops.secrets."grafana/client/secret".path}}";
          scopes = "openid email profile offline_access roles";
          email_attribute_path = "email";
          login_attribute_path = "username";
          name_attribute_path = "full_name";
          auth_url = "${hostname}/realms/master/protocol/openid-connect/auth";
          token_url = "${hostname}/realms/master/protocol/openid-connect/token";
          api_url = "${hostname}/realms/master/protocol/openid-connect/userinfo";
          role_attribute_path = builtins.replaceStrings [ "\n" ] [ "" ] ''
            contains(${roles}, 'grafanaadmin') && 'GrafanaAdmin' 
            || contains(${roles}, 'admin') && 'Admin' 
            || contains(${roles}, 'editor') && 'Editor' 
            || 'Viewer'
          '';
          allow_assign_grafana_admin = true;
        };
    };

    provision = {
      datasources = {
        settings = {
          datasources = [
            {
              uid = "PBFA97CFB590B2093";
              name = "Prometheus";
              type = "prometheus";
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
