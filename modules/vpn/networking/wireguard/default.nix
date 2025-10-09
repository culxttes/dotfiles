{ hostName, systemInfo, ... }:

{
  imports = [
    # keep-sorted start
    ./secrets
    # keep-sorted end
  ]
  ++ (
    if builtins.elem "server" systemInfo.${hostName}.groups then
      [
        ./server.nix
      ]
    else
      [
        ./user.nix
      ]
  );
}
