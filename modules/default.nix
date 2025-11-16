{
  groups,
  hostName,
  lib,
  ...
}:

{
  imports = [
    ./core
  ]
  ++ map (group: ./${group}) groups
  ++ lib.filter builtins.pathExists [
    ./${hostName}
  ];
}
