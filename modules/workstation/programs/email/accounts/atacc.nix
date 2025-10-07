{ username, ... }:

{
  home-manager.users.${username} = {
    accounts.email.accounts.atacc = {
      enable = true;

      realName = "ATACC";
      address = "association.atacc@gmail.com";

      primary = false;

      flavor = "gmail.com";

      thunderbird = {
        enable = true;
      };
      neomutt = {
        enable = true;
      };
    };
  };
}
