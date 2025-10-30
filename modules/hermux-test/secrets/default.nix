{
  sops.secrets = {
    "hermux/tokens" = {
      sopsFile = ./tokens.csv;
      format = "binary";

      owner = "hermux";
    };
  };

  sops.secrets = {
    "hermux/allow" = {
      sopsFile = ./allow.txt;
      format = "binary";

      owner = "hermux";
    };
  };
}
