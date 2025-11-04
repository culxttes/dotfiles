{
  sops.secrets = {
    "postgres/initialScript" = {
      sopsFile = ./initialScript;
      format = "binary";
    };
  };
}
