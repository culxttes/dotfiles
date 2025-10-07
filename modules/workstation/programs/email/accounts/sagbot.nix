{ username, ... }:

{
  home-manager.users.${username} = {
    accounts.email.accounts.sagbot = {
      enable = true;

      realName = "SAGBOT";
      address = "contact@sagbot.com";

      primary = true;

      userName = "contact@sagbot.com";

      smtp = {
        host = "mail.sagbot.com";
        port = 465;
        tls.enable = true;
      };

      imap = {
        host = "mail.sagbot.com";
        port = 993;
        tls.enable = true;
      };

      thunderbird = {
        enable = true;
      };
    };
  };
}
