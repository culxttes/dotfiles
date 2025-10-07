{ username, ... }:

{
  home-manager.users.${username} = {
    accounts.email.accounts.haddaed1 = {
      enable = true;

      realName = "Edouard HADDAG";
      address = "edouard.haddag1@univ-rouen.fr";

      primary = false;

      userName = "haddaed1";

      smtp = {
        host = "smtp.univ-rouen.fr";
        port = 465;
        tls.enable = true;
      };

      imap = {
        host = "imap.univ-rouen.fr";
        port = 993;
        tls.enable = true;
      };

      thunderbird = {
        enable = true;
      };
    };
  };
}
