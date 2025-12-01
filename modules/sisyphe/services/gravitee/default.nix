{
  imports = [
    # keep-sorted start
    ./nixos-module.nix
    # keep-sorted end
  ];

  custom.services.gravitee = {
    enable = true;

    settings = {
      # Management repository configuration
      management = {
        type = "jdbc";
        jdbc = {
          url = "jdbc:postgresql:///gravitee";
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

      # Rate limit repository configuration
      ratelimit = {
        type = "jdbc";
        jdbc = {
          url = "jdbc:postgresql:///gravitee";
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

      # Analytics repository configuration
      analytics = {
        type = "elasticsearch";
        elasticsearch = {
          endpoints = [
            "http://localhost:9200"
          ];
        };
      };

      # HTTP Server configuration (Merged with CORS section)
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

        # CORS configuration
        cors = {
          allow-origin = "*";
          allow-headers = "Cache-Control, Pragma, Origin, Authorization, Content-Type, X-Requested-With";
          allow-methods = "OPTIONS, GET, POST, PUT, DELETE, PATCH";
          exposed-headers = "ETag, X-Xsrf-Token";
          max-age = 1728000;
        };
      };

      # Gateway configuration
      gateway = {
        sharding_tags = [
          # "tag1"
          # "tag2"
        ];
      };

      # API properties encryption
      api = {
        properties = {
          encryption = {
            secret = "your-32-character-secret-key-here";
          };
        };
      };

      # JWT configuration
      jwt = {
        secret = "your-jwt-secret-key-change-this-in-production";
        expire-after = 604800;
        issuer = "gravitee-management-auth";
        cookie-path = "/";
        cookie-domain = "sagbot.com";
        cookie-secure = false;
      };

      # Email configuration
      email = {
        enabled = false;
        host = "localhost";
        port = 25;
        from = "gravitee@sagbot.com";
        username = "gravitee@sagbot.com";
      };

      # Swagger/OpenAPI configuration
      swagger = {
        scheme = "http";
      };

      # Logging configuration
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

      # Plugins configuration
      plugins = {
        path = "\${gravitee.home}/plugins";
      };

      # Services configuration
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

      # Portal configuration
      portal = {
        url = "http://127.0.0.82:8085";
        entrypoint = "/portal";
      };

      # Console (Management UI) configuration
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
