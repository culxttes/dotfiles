{ modulesPath, ... }:

{
  imports = [
    # keep-sorted start
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
    ./nix
    ./programs
    # keep-sorted end
  ];
}
