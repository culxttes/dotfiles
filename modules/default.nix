{ groups, ... }:

{
  imports = map (type: ./. + "/${type}") groups ++ [
    ./core
  ];
}
