{ username, ... }:

{
  home-manager.users.${username} = {
    accounts.email.accounts.haddaedo = {
      enable = true;

      realName = "Edouard HADDAG";
      address = "edouard.haddag@univ-rouen.fr";

      primary = false;

      userName = "haddaedo";

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
      neomutt = {
        enable = true;
      };
    };
  };
}
