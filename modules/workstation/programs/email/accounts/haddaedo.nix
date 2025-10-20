{
  config,
  pkgs,
  username,
  ...
}:
let
  inherit (config.users.users.${username}) home;
in
{
  home-manager.users.${username} = {
    accounts.email.accounts.haddaedo = {
      enable = true;

      realName = pkgs.lib.custom.decodeBase64 "RWRvdWFyZCBIQUREQUc=";
      address = pkgs.lib.custom.decodeBase64 "ZWRvdWFyZC5oYWRkYWdAdW5pdi1yb3Vlbi5mcg==";
      passwordCommand = "${pkgs.openssl}/bin/openssl enc -aes-256-cbc -K $(cat ${home}/.ssh/nixos-email.key) -iv $(cat ${home}/.ssh/nixos-email.iv) -d -in ${
        config.sops.secrets."email/haddaedo/passwordEnc".path
      }";

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

      thunderbird.enable = true;
      neomutt = {
        enable = true;

        mailboxName = "haddaedo";
      };

      msmtp.enable = true;
      mbsync = {
        enable = true;

        create = "both";
        remove = "both";
        expunge = "both";
      };
      notmuch = {
        enable = true;

        neomutt.enable = true;
      };
    };
  };
}
