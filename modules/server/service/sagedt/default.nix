{
  users.users.sagedt = {
    isSystemUser = true;
    group = "sagedt";
  };

  users.groups.sagedt = { };

  systemd.services.sagedtAPI = {
    description = "API Rust - Sagedt";
    after = [ "network.target" ];

    serviceConfig = {
      User = "sagedt";
      Group = "sagedt";
      WorkingDirectory = "/opt/ADEcampus-API/";
      ExecStart = "/opt/ADEcampus-API/target/release/ADEcampus";
      Restart = "always";
      Environment = "RUST_LOG=info";
    };

    wantedBy = [ "multi-user.target" ];
  };
}
