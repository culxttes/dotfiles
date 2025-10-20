{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    services.mbsync = {
      enable = true;

      postExec = "${
        pkgs.writeShellApplication {
          name = "mbsync-postexec";
          runtimeInputs = with pkgs; [
            libnotify
            toybox
            notmuch
          ];
          text = ''
            notmuch new
            NEW_COUNT=$(notmuch search --output=messages tag:unread | wc -l)
            if [ "$NEW_COUNT" -gt 0 ]; then
              notify-send "New Mail" "$NEW_COUNT unread messages"
            fi
          '';
        }
      }/bin/mbsync-postexec";
    };
  };
}
