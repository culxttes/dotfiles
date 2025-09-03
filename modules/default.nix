{ groups, hostName, ... }:

{
  imports = map (type: ./. + "/${type}") groups ++ [
    ./core
    ./${hostName}
  ];
}
