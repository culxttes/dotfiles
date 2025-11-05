{ username, ... }:
#
# Enables Git with user info and defines a pull-all alias.
#
{
  imports = [
    # keep-sorted start
    ./gh.nix
    # keep-sorted end
  ];

  home-manager.users.${username} = {
    programs.git = {
      enable = true;

      settings = {
        user = {
          name = "c2fc2f";
          email = "contact@c2fc2f.com";
        };

        alias = {
          pull-all = "!git pull && git submodule update --init --recursive";
        };
      };
    };

    programs.zsh.shellAliases = {
      glt = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all";
    };
  };
}
