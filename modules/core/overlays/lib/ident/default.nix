_: prev: {
  lib = prev.lib.extend (
    _: libPrev: {
      custom = (libPrev.custom or { }) // {
        indent =
          n: text:
          let
            spaces = libPrev.concatStrings (libPrev.replicate n " ");
            lines = libPrev.splitString "\n" text;
            filteredLines = if lines != [ ] && libPrev.last lines == "" then libPrev.init lines else lines;
          in
          libPrev.concatMapStringsSep "\n" (line: spaces + line) filteredLines;
      };
    }
  );
}
