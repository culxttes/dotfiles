{
  services.neo4j = {
    enable = true;

    https.enable = false;
    http = {
      listenAddress = "127.0.0.1:7474";
      advertisedAddress = "neo4j.sagbot.com";
    };

    bolt = {
      listenAddress = "0.0.0.0:7687";
      advertisedAddress = "neo4j.sagbot.com";

      tlsLevel = "REQUIRED";
      sslPolicy = "bolt";
    };

    ssl.policies.bolt = {
      privateKey = "/var/lib/acme/sagbot/key.pem";
      publicCertificate = "/var/lib/acme/sagbot/cert.pem";
    };
  };

  users.groups.acme.members = [
    "neo4j"
  ];

  networking.firewall.allowedTCPPorts = [
    7687
  ];
}
