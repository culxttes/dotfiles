{
  sops.secrets = {
    "litellm/environement" = {
      sopsFile = ./environment;
      format = "binary";
    };
  };
}
