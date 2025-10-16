_: prev: {
  lib = prev.lib.extend (
    _: libPrev: {
      custom = (libPrev.custom or { }) // rec {
        base64Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
        base64Table = builtins.listToAttrs (
          libPrev.imap0 (i: c: libPrev.nameValuePair c i) (libPrev.stringToCharacters base64Chars)
        );

        intToChar =
          int:
          let
            hexDigits = "0123456789abcdef";
            toHex =
              n:
              let
                d3 = builtins.substring (n / 4096) 1 hexDigits;
                d2 = builtins.substring (libPrev.mod (n / 256) 16) 1 hexDigits;
                d1 = builtins.substring (libPrev.mod (n / 16) 16) 1 hexDigits;
                d0 = builtins.substring (libPrev.mod n 16) 1 hexDigits;
              in
              "${d3}${d2}${d1}${d0}";
          in
          if int < 65536 then
            builtins.fromJSON ''"\u${toHex int}"''
          else
            let
              high = int / 65536;
              low = libPrev.mod int 65536;
            in
            builtins.fromJSON ''"\u${toHex high}\u${toHex low}"'';

        decodeUtf8 =
          bytes:
          builtins.foldl' (
            acc: _:
            let
              firstByte = libPrev.elemAt bytes 0;
              numBytes =
                if firstByte < 128 then
                  1
                else if firstByte < 224 then
                  2
                else if firstByte < 240 then
                  3
                else
                  4;
            in
            if acc == "" && builtins.length bytes >= numBytes then
              let
                codepoint =
                  if numBytes == 1 then
                    firstByte
                  else if numBytes == 2 then
                    ((libPrev.mod firstByte 32) * 64) + (libPrev.mod (libPrev.elemAt bytes 1) 64)
                  else if numBytes == 3 then
                    ((libPrev.mod firstByte 16) * 4096)
                    + ((libPrev.mod (libPrev.elemAt bytes 1) 64) * 64)
                    + (libPrev.mod (libPrev.elemAt bytes 2) 64)
                  else
                    ((libPrev.mod firstByte 8) * 262144)
                    + ((libPrev.mod (libPrev.elemAt bytes 1) 64) * 4096)
                    + ((libPrev.mod (libPrev.elemAt bytes 2) 64) * 64)
                    + (libPrev.mod (libPrev.elemAt bytes 3) 64);
                remaining = libPrev.drop numBytes bytes;
              in
              (intToChar codepoint) + (decodeUtf8 remaining)
            else
              acc
          ) "" bytes;

        decodeBase64Chunk =
          c1: c2: c3: c4:
          let
            b1 = base64Table.${c1};
            b2 = base64Table.${c2};
            b3 = if c3 == "=" then 0 else base64Table.${c3};
            b4 = if c4 == "=" then 0 else base64Table.${c4};

            byte1 = (b1 * 4) + (b2 / 16);
            byte2 = ((libPrev.mod b2 16) * 16) + (b3 / 4);
            byte3 = ((libPrev.mod b3 4) * 64) + b4;

            padding =
              if c3 == "=" then
                1
              else if c4 == "=" then
                2
              else
                0;
          in
          if padding == 1 then
            decodeUtf8 [ byte1 ]
          else if padding == 2 then
            decodeUtf8 [
              byte1
              byte2
            ]
          else
            decodeUtf8 [
              byte1
              byte2
              byte3
            ];
        decodeBase64 =
          str:
          let
            cleaned = builtins.replaceStrings [ "\n" " " "\t" ] [ "" "" "" ] str;
            chars = libPrev.stringToCharacters cleaned;
            chunks = libPrev.imap0 (i: _: libPrev.sublist (i * 4) 4 chars) (
              libPrev.range 0 ((builtins.length chars) / 4 - 1)
            );
          in
          libPrev.concatMapStrings (
            chunk:
            if builtins.length chunk == 4 then
              decodeBase64Chunk (builtins.elemAt chunk 0) (builtins.elemAt chunk 1) (builtins.elemAt chunk 2) (
                builtins.elemAt chunk 3
              )
            else
              ""
          ) chunks;
      };
    }
  );
}
