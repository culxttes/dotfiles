{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = [
      (pkgs.appimageTools.wrapType2 {
        pname = "noi";
        version = "0.4.0";
        src = builtins.fetchurl {
          url =
            "https://github.com/lencx/Noi/releases/download/v0.4.0/Noi_linux_0.4.0.AppImage";
          sha256 = "0w03wjrykhs7l7q7hg7dk3brppjagdhgr9x6rly7whi8j4r3a0k7";
        };
      })
    ];
  };
}
