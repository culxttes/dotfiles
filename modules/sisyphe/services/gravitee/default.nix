{ pkgs, ... }:

{
  imports = [
    # keep-sorted start
    ./nixos-module.nix
    # keep-sorted end
  ];

  custom.services.gravitee = {
    enable = true;

    plugins = {
      jdbc = [
        (pkgs.fetchurl {
          url = "https://jdbc.postgresql.org/download/postgresql-42.7.8.jar";
          sha256 = "sha256-KjKp3LxC1npQrToN5e/RAsjSvkZyAEXyy9ZonxYKt8c=";
        })
        (pkgs.fetchurl {
          url = "https://repo1.maven.org/maven2/org/postgresql/r2dbc-postgresql/1.0.2.RELEASE/r2dbc-postgresql-1.0.2.RELEASE.jar";
          sha256 = "sha256-rERI9Y7CEy+l1YP/N1OkUsfIAIAp85ZlzvWju5eCOkg=";
        })
      ];
    };

    settings = {
      management = {
        type = "jdbc";
        jdbc = {
          url = "jdbc:postgresql://localhost/gravitee?host=/run/postgresql/";
          username = "gravitee";
          pool = {
            autoCommit = true;
            connectionTimeout = 10000;
            idleTimeout = 600000;
            maxLifetime = 1800000;
            minIdle = 10;
            maxPoolSize = 50;
          };
        };
      };

      ratelimit = {
        type = "jdbc";
        jdbc = {
          url = "jdbc:postgresql://localhost/gravitee?host=/run/postgresql/";
          username = "gravitee";
          pool = {
            autoCommit = true;
            connectionTimeout = 10000;
            idleTimeout = 600000;
            maxLifetime = 1800000;
            minIdle = 10;
            maxPoolSize = 50;
          };
        };
      };

      analytics = {
        type = "elasticsearch";
        elasticsearch = {
          endpoints = [
            "http://localhost:9200"
          ];
        };
      };

      http = {
        port = 8082;
        host = "127.0.0.82";
        idleTimeout = 30000;
        tcpKeepAlive = true;
        compressionSupported = false;
        maxHeaderSize = 8192;
        maxChunkSize = 8192;
        maxInitialLineLength = 4096;
        instances = 0;
        requestTimeout = 30000;

        cors = {
          allow-origin = "*";
          allow-headers = "Cache-Control, Pragma, Origin, Authorization, Content-Type, X-Requested-With";
          allow-methods = "OPTIONS, GET, POST, PUT, DELETE, PATCH";
          exposed-headers = "ETag, X-Xsrf-Token";
          max-age = 1728000;
        };
      };

      gateway = {
        sharding_tags = [
          # "tag1"
          # "tag2"
        ];
      };

      api = {
        properties = {
          encryption = {
            secret = "your-32-character-secret-key-here";
          };
        };
      };

      jwt = {
        secret = "your-jwt-secret-key-change-this-in-production";
        expire-after = 604800;
        issuer = "gravitee-management-auth";
        cookie-path = "/";
        cookie-domain = "sagbot.com";
        cookie-secure = false;
      };

      email = {
        enabled = false;
        host = "localhost";
        port = 25;
        from = "gravitee@sagbot.com";
        username = "gravitee@sagbot.com";
      };

      swagger = {
        scheme = "http";
      };

      logging = {
        level = {
          "io.gravitee" = "INFO";
        };
        file = {
          enabled = true;
          rollingPolicy = "time";
          maxHistory = 30;
        };
      };

      plugins = {
        path = "\${gravitee.home}/plugins";
      };

      services = {
        core = {
          http = {
            enabled = true;
            port = 18082;
            host = "localhost";
            authentication = {
              type = "basic";
              users = {
                admin = "adminadmin";
              };
            };
          };
        };
      };

      portal = {
        url = "http://127.0.0.82:8085";
        entrypoint = "/portal";
      };

      console = {
        url = "http://127.0.0.82:3000";
      };
    };
  };

  services.postgresql = {
    ensureDatabases = [
      "gravitee"
    ];

    ensureUsers = [
      {
        name = "gravitee";
        ensureDBOwnership = true;
      }
    ];
  };
}
