{ username, ... }:

{
  home-manager.users.${username} = {
    programs.neomutt = {
      enable = true;

      sidebar.enable = true;

      sort = "reverse-date-received";
    };
  };
}
