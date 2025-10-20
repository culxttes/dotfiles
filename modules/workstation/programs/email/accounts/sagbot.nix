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
    accounts.email.accounts.sagbot = {
      enable = true;

      realName = pkgs.lib.custom.decodeBase64 "U0FHQk9U";
      address = pkgs.lib.custom.decodeBase64 "Y29udGFjdEBzYWdib3QuY29t";
      passwordCommand = "${pkgs.openssl}/bin/openssl enc -aes-256-cbc -K $(cat ${home}/.ssh/nixos-email.key) -iv $(cat ${home}/.ssh/nixos-email.iv) -d -in ${
        config.sops.secrets."email/sagbot/passwordEnc".path
      }";

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

      thunderbird.enable = true;
      neomutt = {
        enable = true;

        mailboxName = "sagbot";
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
