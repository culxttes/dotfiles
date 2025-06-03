{ pkgs, username, ... }:
/*
  devenv, a Nix-based development environment manager. It allows you to define
  reproducible development environments using a `devenv.nix` file, making it
  easy to manage tools, dependencies, services, and environment variables for
  projects. Great for onboarding and consistent builds across machines.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.devenv
    ];
  };
}
