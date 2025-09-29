{ groups, hostName, ... }:

{
  imports = map (group: ./. + "/${group}") groups ++ [
    # keep-sorted start
    ./${hostName}
    ./core
    # keep-sorted end
  ];
}
