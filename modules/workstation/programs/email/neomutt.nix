{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      lynx
      abook
    ];

    programs.neomutt = {
      enable = true;

      sidebar = {
        enable = true;

        width = 35;
        shortPath = true;
        format = "%D%?F? [%F]?%* %?N?%N/? %?S?%S?";
      };

      sort = "reverse-date";
      vimKeys = true;

      settings = {
        query_command = "\"abook --mutt-query '%s'\"";

        forward_format = "\"Fwd: %s\"";
        forward_attachments = "yes";
      };

      binds = [
        {
          map = [
            "index"
            "pager"
          ];
          key = "i";
          action = "noop";
        }
        {
          map = [
            "index"
            "pager"
            "browser"
          ];
          key = "gg";
          action = "noop";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "gT";
          action = "noop";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "gt";
          action = "noop";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "g";
          action = "noop";
        }
        {
          map = [
            "index"
          ];
          key = "\\Cf";
          action = "noop";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "M";
          action = "noop";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "C";
          action = "noop";
        }
        {
          map = [
            "index"
          ];
          key = "dd";
          action = "noop";
        }
        {
          map = [
            "index"
          ];
          key = "dT";
          action = "noop";
        }
        {
          map = [
            "index"
          ];
          key = "dt";
          action = "noop";
        }
        #
        # ====================================================================
        #
        {
          map = [
            "index"
          ];
          key = "g";
          action = "first-entry";
        }
        {
          map = [
            "index"
          ];
          key = "j";
          action = "next-entry";
        }
        {
          map = [
            "index"
          ];
          key = "k";
          action = "previous-entry";
        }
        {
          map = [
            "attach"
          ];
          key = "<return>";
          action = "view-mailcap";
        }
        {
          map = [
            "attach"
          ];
          key = "l";
          action = "view-mailcap";
        }
        {
          map = [
            "editor"
          ];
          key = "<space>";
          action = "noop";
        }
        {
          map = [
            "index"
          ];
          key = "G";
          action = "last-entry";
        }
        {
          map = [
            "pager"
            "attach"
          ];
          key = "h";
          action = "exit";
        }
        {
          map = [
            "pager"
          ];
          key = "j";
          action = "next-line";
        }
        {
          map = [
            "pager"
          ];
          key = "k";
          action = "previous-line";
        }
        {
          map = [
            "pager"
          ];
          key = "l";
          action = "view-attachments";
        }
        {
          map = [
            "index"
          ];
          key = "D";
          action = "delete-message";
        }
        {
          map = [
            "index"
          ];
          key = "U";
          action = "undelete-message";
        }
        {
          map = [
            "index"
          ];
          key = "L";
          action = "limit";
        }
        {
          map = [
            "index"
          ];
          key = "h";
          action = "noop";
        }
        {
          map = [
            "index"
          ];
          key = "l";
          action = "display-message";
        }
        {
          map = [
            "index"
            "query"
          ];
          key = "<space>";
          action = "tag-entry";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "H";
          action = "view-raw-message";
        }
        {
          map = [
            "browser"
          ];
          key = "l";
          action = "select-entry";
        }
        {
          map = [
            "browser"
          ];
          key = "gg";
          action = "top-page";
        }
        {
          map = [
            "browser"
          ];
          key = "G";
          action = "bottom-page";
        }
        {
          map = [
            "pager"
          ];
          key = "gg";
          action = "top";
        }
        {
          map = [
            "pager"
          ];
          key = "G";
          action = "bottom";
        }
        {
          map = [
            "index"
            "pager"
            "browser"
          ];
          key = "d";
          action = "half-down";
        }
        {
          map = [
            "index"
            "pager"
            "browser"
          ];
          key = "u";
          action = "half-up";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "S";
          action = "sync-mailbox";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "R";
          action = "group-reply";
        }
        {
          map = [
            "index"
          ];
          key = "\\031";
          action = "previous-undeleted";
        }
        {
          map = [
            "index"
          ];
          key = "\\005";
          action = "next-undeleted";
        }
        {
          map = [
            "pager"
          ];
          key = "\\031";
          action = "previous-line";
        }
        {
          map = [
            "pager"
          ];
          key = "\\005";
          action = "next-line";
        }
        {
          map = [
            "editor"
          ];
          key = "<Tab>";
          action = "complete-query";
        }
        #
        # ====================================================================
        #
        {
          map = [
            "index"
            "pager"
          ];
          key = "\\Ck";
          action = "sidebar-prev";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "\\Cj";
          action = "sidebar-next";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "\\Co";
          action = "sidebar-open";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "\\Cp";
          action = "sidebar-prev-new";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "\\Cn";
          action = "sidebar-next-new";
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "B";
          action = "sidebar-toggle-visible";
        }
      ];

      macros = [
        {
          map = [
            "browser"
          ];
          key = "h";
          action = "<change-dir><kill-line>..<enter>";
          # Go to parent folder
        }
        #
        # ====================================================================
        #
        {
          map = [
            "index"
            "pager"
          ];
          key = "gi";
          action = "<change-folder>=Inbox<enter>";
          # go to inbox
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Mi";
          action = ";<save-message>=Inbox<enter>";
          # move mail to inbox
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Ci";
          action = ";<copy-message>=Inbox<enter>";
          # copy mail to inbox
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "gd";
          action = "<change-folder>=Drafts<enter>";
          # go to drafts
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Md";
          action = ";<save-message>=Drafts<enter>";
          # move mail to drafts
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Cd";
          action = ";<copy-message>=Drafts<enter>";
          # copy mail to drafts
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "gj";
          action = "<change-folder>=Junk<enter>";
          # go to junk
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Mj";
          action = ";<save-message>=Junk<enter>";
          # move mail to junk
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Cj";
          action = ";<copy-message>=Junk<enter>";
          # copy mail to junk
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "gt";
          action = "<change-folder>=Trash<enter>";
          # go to trash
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Mt";
          action = ";<save-message>=Trash<enter>";
          # move mail to trash
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Ct";
          action = ";<copy-message>=Trash<enter>";
          # copy mail to trash
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "gs";
          action = "<change-folder>=Sent<enter>";
          # go to sent
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Ms";
          action = ";<save-message>=Sent<enter>";
          # move mail to sent
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Cs";
          action = ";<copy-message>=Sent<enter>";
          # copy mail to sent
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "ga";
          action = "<change-folder>=Archive<enter>";
          # go to archive
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Ma";
          action = ";<save-message>=Archive<enter>";
          # move mail to archive
        }
        {
          map = [
            "index"
            "pager"
          ];
          key = "Ca";
          action = ";<copy-message>=Archive<enter>";
          # copy mail to archive
        }
        #
        # ====================================================================
        #
        {
          map = [
            "index"
          ];
          key = "\\eg";
          action = "<enter-command>unset wait_key<enter><shell-escape>gpg --list-secret-keys; printf 'Enter email ID of user to publish: '; read eID; printf 'Enter fingerprint of GPG key to publish: '; read eFGPT; $prefix/libexec/gpg-wks-client --create \\\$eFGPT \\\$eID | msmtp --read-envelope-from --read-recipients -a $fulladdr<enter>";
          # publish GPG key to WKS provider
        }
        {
          map = [
            "index"
          ];
          key = "\\eh";
          action = "<pipe-message>$prefix/libexec/gpg-wks-client --receive | msmtp --read-envelope-from --read-recipients -a $fulladdr<enter>";
          # confirm GPG publication
        }
        #
        # ====================================================================
        #

        {
          map = [
            "index"
            "pager"
          ];
          key = "a";
          action = "<enter-command>set my_pipe_decode=\$pipe_decode pipe_decode<return><pipe-message>abook --add-email<return><enter-command>set pipe_decode=\$my_pipe_decode; unset my_pipe_decode<return>";
          # add the sender address to abook
        }
        {
          map = [
            "index"
          ];
          key = "\\Cr";
          action = "T~U<enter><tag-prefix><clear-flag>N<untag-pattern>.<enter>";
          # mark all messages as read
        }
        {
          map = [
            "index"
          ];
          key = "O";
          action = "<shell-escape>mailsync<enter>";
          # run mailsync to sync all mail
        }
        {
          map = [
            "index"
          ];
          key = "\\Cf";
          action = "<enter-command>unset wait_key<enter><shell-escape>printf 'Enter a search term to find with notmuch: '; read x; echo \$x >\"\${XDG_CACHE_HOME:-\$HOME/.cache}/mutt_terms\"<enter><limit>~i \"\`notmuch search --output=messages \$(cat \"\${XDG_CACHE_HOME:-\$HOME/.cache}/mutt_terms\") | head -n 600 | perl -le '@a=<>;s/\^id:// for@a;$,=\"|\";print@a' | perl -le '@a=<>; chomp@a; s/\\+/\\\\+/g for@a; s/\\$/\\\\\\$/g for@a;print@a' \`\"<enter>";
          # show only messages matching a notmuch pattern
        }
        {
          map = [
            "index"
          ];
          key = "A";
          action = "<limit>all\\n";
          # show all messages (undo limit)
        }
      ];

      extraConfig = ''
        # Default index colors:
        color index yellow default '.*'
        color index_author red default '.*'
        color index_number blue default
        color index_subject cyan default '.*'

        # New mail is boldened:
        color index brightyellow black "~N"
        color index_author brightred black "~N"
        color index_subject brightcyan black "~N"

        # Tagged mail is highlighted:
        color index brightyellow blue "~T"
        color index_author brightred blue "~T"
        color index_subject brightcyan blue "~T"

        # Flagged mail is highlighted:
        color index brightgreen default "~F"
        color index_subject brightgreen default "~F"
        color index_author brightgreen default "~F"

        # Other colors and aesthetic settings:
        mono bold bold
        mono underline underline
        mono indicator reverse
        mono error bold
        color normal default default
        color indicator brightblack white
        color sidebar_highlight red default
        color sidebar_divider brightblack black
        color sidebar_flagged red black
        color sidebar_new green black
        color error red default
        color tilde black default
        color message cyan default
        color markers red white
        color attachment white default
        color search brightmagenta default
        color status brightyellow black
        color hdrdefault brightgreen default
        color quoted green default
        color quoted1 blue default
        color quoted2 cyan default
        color quoted3 yellow default
        color quoted4 red default
        color quoted5 brightred default
        color signature brightgreen default
        color bold black default
        color underline black default

        # Regex highlighting:
        color header brightmagenta default "^From"
        color header brightcyan default "^Subject"
        color header brightwhite default "^(CC|BCC)"
        color header blue default ".*"
        color body brightred default "[\-\.+_a-zA-Z0-9]+@[\-\.a-zA-Z0-9]+" # Email addresses
        color body brightblue default "(https?|ftp)://[\-\.,/%~_:?&=\#a-zA-Z0-9]+" # URL
        color body green default "\`[^\`]*\`" # Green text between ` and `
        color body brightblue default "^# \.*" # Headings as bold blue
        color body brightcyan default "^## \.*" # Subheadings as bold cyan
        color body brightgreen default "^### \.*" # Subsubheadings as bold green
        color body yellow default "^(\t| )*(-|\\*) \.*" # List items as yellow
        color body brightcyan default "[;:][-o][)/(|]" # emoticons
        color body brightcyan default "[;:][)(|]" # emoticons
        color body brightcyan default "[ ][*][^*]*[*][ ]?" # more emoticon?
        color body brightcyan default "[ ]?[*][^*]*[*][ ]" # more emoticon?
        color body red default "(BAD signature)"
        color body cyan default "(Good signature)"
        color body brightblack default "^gpg: Good signature .*"
        color body brightyellow default "^gpg: "
        color body brightyellow red "^gpg: BAD signature from.*"
        mono body bold "^gpg: Good signature"
        mono body bold "^gpg: BAD signature from.*"
        color body red default "([a-z][a-z0-9+-]*://(((([a-z0-9_.!~*'();:&=+$,-]|%[0-9a-f][0-9a-f])*@)?((([a-z0-9]([a-z0-9-]*[a-z0-9])?)\\.)*([a-z]([a-z0-9-]*[a-z0-9])?)\\.?|[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)(:[0-9]+)?)|([a-z0-9_.!~*'()$,;:@&=+-]|%[0-9a-f][0-9a-f])+)(/([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*(;([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*)*(/([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*(;([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*)*)*)?(\\?([a-z0-9_.!~*'();/?:@&=+$,-]|%[0-9a-f][0-9a-f])*)?(#([a-z0-9_.!~*'();/?:@&=+$,-]|%[0-9a-f][0-9a-f])*)?|(www|ftp)\\.(([a-z0-9]([a-z0-9-]*[a-z0-9])?)\\.)*([a-z]([a-z0-9-]*[a-z0-9])?)\\.?(:[0-9]+)?(/([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*(;([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*)*(/([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*(;([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*)*)*)?(\\?([-a-z0-9_.!~*'();/?:@&=+$,]|%[0-9a-f][0-9a-f])*)?(#([-a-z0-9_.!~*'();/?:@&=+$,]|%[0-9a-f][0-9a-f])*)?)[^].,:;!)? \t\r\n<>\"]"
      '';
    };
  };
}
