{ config, ... }:

{
  services.neo4j = {
    enable = true;

    https = {
      enable = false;
      listenAddress = "0.0.0.0:7473";
      advertisedAddress = "neo4j.sagbot.com";

    };

    http = {
      enable = true;
      listenAddress = "0.0.0.0:7474";
      advertisedAddress = "neo4j.sagbot.com";
    };

    bolt = {
      listenAddress = "0.0.0.0:7687";
      advertisedAddress = "neo4j.sagbot.com";

      tlsLevel = "REQUIRED";
      sslPolicy = "bolt";
    };

    ssl.policies.bolt =
      let
        certDir = config.security.acme.certs."sagbot".directory;
      in
      {
        clientAuth = "OPTIONAL";

        privateKey = "${certDir}/key.pem";
        publicCertificate = "${certDir}/cert.pem";
      };

    extraServerConfig = ''
      dbms.ssl.policy.bolt.enabled=true
    '';
  };

  users.groups.acme.members = [
    "neo4j"
  ];

  networking.firewall.allowedTCPPorts = [
    7687
  ];
}
