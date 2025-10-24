{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    accounts.email.accounts.sagbot = {
      enable = true;

      realName = pkgs.lib.custom.decodeBase64 "U0FHQk9U";
      address = pkgs.lib.custom.decodeBase64 "Y29udGFjdEBzYWdib3QuY29t";
      primary = true;

      userName = pkgs.lib.custom.decodeBase64 "Y29udGFjdEBzYWdib3QuY29t";

      smtp = {
        host = pkgs.lib.custom.decodeBase64 "bWFpbC5zYWdib3QuY29t";
        port = 465;
        tls.enable = true;
      };

      imap = {
        host = pkgs.lib.custom.decodeBase64 "bWFpbC5zYWdib3QuY29t";
        port = 993;
        tls.enable = true;
      };

      gpg.key = "0B83 4004 F867 26EA 20AC  661C 938C 455B 4327 79F3";

      thunderbird.enable = true;
    };
  };
}
