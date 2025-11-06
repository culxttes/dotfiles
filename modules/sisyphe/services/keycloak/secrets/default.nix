{
  sops.secrets = {
    "keycloak/passwordDB" = {
      sopsFile = ./password;
      format = "binary";
    };
  };
}
