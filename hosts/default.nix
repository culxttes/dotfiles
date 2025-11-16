{ hostName, lib, ... }:

{
  imports = lib.filter builtins.pathExists [
    ./${hostName}
  ];
}
