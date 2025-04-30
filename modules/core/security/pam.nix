{
  security.pam = {
    u2f = {
      settings = { cue = true; };
      control = "required";
    };
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
      hyprlock.u2fAuth = true;
    };
  };
}
