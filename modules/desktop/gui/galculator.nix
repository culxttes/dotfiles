{ pkgs, username, ... }:
/*
  galculator, a lightweight and user-friendly GTK-based calculator
  application. It supports both basic and scientific modes, making it suitable
  for quick arithmetic as well as more advanced calculations in a desktop
  environment.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.galculator
    ];
  };
}
