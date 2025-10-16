{ username, ... }:

{
  # echo "<password> | , openssl enc -aes-256-cbc -K $(cat ~/.ssh/nixos-email.key) -iv $(cat ~/.ssh/nixos-email.iv) -out <account>
  # , sops encrypt -a "$(cat ~/.ssh/nixos-workstation.pub | , ssh-to-age)" <account> > <account>
  sops.secrets = {
    "email/atacc/passwordEnc" = {
      sopsFile = ./atacc;
      format = "binary";
      owner = username;
    };
    "email/haddaed1/passwordEnc" = {
      sopsFile = ./haddaed1;
      format = "binary";
      owner = username;
    };
    "email/haddaedo/passwordEnc" = {
      sopsFile = ./haddaedo;
      format = "binary";
      owner = username;
    };
    "email/sagbot/passwordEnc" = {
      sopsFile = ./sagbot;
      format = "binary";
      owner = username;
    };
  };
}
