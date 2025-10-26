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

      gpg.key = "0x938C455B432779F33";

      thunderbird.enable = true;
    };
  };
}
