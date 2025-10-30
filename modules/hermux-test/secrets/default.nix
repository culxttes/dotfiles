{
  sops.secrets = {
    "hermux/tokens" = {
      sopsFile = ./tokens.csv;
      format = "text";

      owner = "hermux";
    };
  };

  sops.secrets = {
    "hermux/allow" = {
      sopsFile = ./allow.txt;
      format = "text";

      owner = "hermux";
    };
  };
}
