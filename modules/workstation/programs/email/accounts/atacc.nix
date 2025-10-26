{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    accounts.email.accounts.atacc = {
      enable = true;

      realName = pkgs.lib.custom.decodeBase64 "QVRBQ0M=";
      address = pkgs.lib.custom.decodeBase64 "YXNzb2NpYXRpb24uYXRhY2NAZ21haWwuY29t";

      primary = false;

      flavor = pkgs.lib.custom.decodeBase64 "Z21haWwuY29t";

      gpg.key = "0x938C455B432779F33";

      thunderbird.enable = true;
    };
  };
}
