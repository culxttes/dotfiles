{ groups, hostName, ... }:

{
  imports = map (group: ./. + "/${group}") groups ++ [
    ./core
    ./${hostName}
  ];
}
