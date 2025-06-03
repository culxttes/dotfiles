{ pkgs, username, ... }:
/*
  sops, a tool for managing and editing encrypted files. It supports
  encryption of YAML, JSON, ENV, and INI files using GPG, age, AWS KMS, Azure
  Key Vault, or GCP KMS.

  Commonly used for securely storing secrets in Git repositories.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.sops
    ];
  };
}
