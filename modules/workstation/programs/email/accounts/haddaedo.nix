{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    accounts.email.accounts.haddaedo = {
      enable = true;

      realName = pkgs.lib.custom.decodeBase64 "RWRvdWFyZCBIQUREQUc=";
      address = pkgs.lib.custom.decodeBase64 "ZWRvdWFyZC5oYWRkYWdAdW5pdi1yb3Vlbi5mcg==";

      primary = false;

      userName = pkgs.lib.custom.decodeBase64 "aGFkZGFlZG8=";

      smtp = {
        host = pkgs.lib.custom.decodeBase64 "c210cC51bml2LXJvdWVuLmZy";
        port = 465;
        tls.enable = true;
      };

      imap = {
        host = pkgs.lib.custom.decodeBase64 "aW1hcC51bml2LXJvdWVuLmZy";
        port = 993;
        tls.enable = true;
      };

      gpg.key = "0x938C455B432779F33";

      thunderbird.enable = true;
    };
  };
}
