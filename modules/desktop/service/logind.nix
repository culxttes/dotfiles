/*
  Configures systemd-logind, the service responsible for managing user logins,
  seats, power actions (suspend, hibernate, shutdown), and session tracking.

   This block allows you to:
   - Define behavior when the lid is closed (e.g., suspend or ignore).
   - Control power key, sleep key, and idle actions.
   - Set session handling policies.
*/
{
  services.logind = {
    extraConfig = ''
      HandlePowerKey=ignore
    '';
  };
}
