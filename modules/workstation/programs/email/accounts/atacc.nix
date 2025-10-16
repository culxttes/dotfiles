{
  pkgs,
  config,
  username,
  ...
}:
let
  inherit (config.users.users.${username}) home;
in
{
  home-manager.users.${username} = {
    accounts.email.accounts.atacc = {
      enable = true;

      realName = pkgs.lib.custom.decodeBase64 "QVRBQ0M=";
      address = pkgs.lib.custom.decodeBase64 "YXNzb2NpYXRpb24uYXRhY2NAZ21haWwuY29t";
      passwordCommand = "${pkgs.openssl}/bin/openssl enc -aes-256-cbc -K $(cat ${home}/.ssh/nixos-email.key) -iv $(cat ${home}/.ssh/nixos-email.iv) -d -in ${
        config.sops.secrets."email/atacc/passwordEnc".path
      }";

      primary = false;

      flavor = pkgs.lib.custom.decodeBase64 "Z21haWwuY29t";

      thunderbird.enable = true;
      neomutt.enable = true;

      msmtp.enable = true;
      mbsync = {
        enable = true;

        create = "both";
        remove = "both";
        expunge = "both";
      };
    };
  };
}
