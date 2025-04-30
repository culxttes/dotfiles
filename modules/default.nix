{ systemTypes, ... }:

{
  imports = map (type: ./. + "/${type}") systemTypes ++ [
    ./core
  ];
}
