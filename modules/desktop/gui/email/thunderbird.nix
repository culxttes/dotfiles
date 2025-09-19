{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.thunderbird = {
      enable = true;

      profiles.default = {
        isDefault = true;

        withExternalGnupg = true;

        settings = {
          "extensions.activeThemeID" = "thunderbird-compact-dark@mozilla.org";
          "extensions.autoDisableScopes" = 0;
        };

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          languagetool
        ];
      };
    };

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
