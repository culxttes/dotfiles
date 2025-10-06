final: prev: {
  custom = (prev.custom or { }) // {
    is-ctrl-pressed = prev.callPackage ./is-ctrl-pressed { };
  };
}
