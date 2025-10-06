{ secrets, username, ... }:

{
  imports = [
    # keep-sorted start
    ./thunderbird.nix
    # keep-sorted end
  ];

  home-manager.users.${username} = {
    accounts.email.accounts = secrets.accounts.email.accounts;
  };
}
