final: prev:
let
  spotx = prev.fetchurl {
    url = "https://raw.githubusercontent.com/SpotX-Official/SpotX-Bash/refs/heads/main/spotx.sh";
    hash = "sha256-4QSzZcfmoIsTX2FW99JK5gg0Kh6YLUqVwMgX+j5bQdw=";
  };
in
{
  spotify = prev.spotify.overrideAttrs (old: {
    nativeBuildInputs =
      old.nativeBuildInputs
      ++ (with prev; [
        util-linux
        perl
        unzip
        zip
        curl
      ]);

    unpackPhase =
      builtins.replaceStrings
        [ "runHook postUnpack" ]
        [
          ''
            patchShebangs --build ${spotx}
            runHook postUnpack
          ''
        ]
        old.unpackPhase;

    installPhase =
      builtins.replaceStrings
        [ "runHook postInstall" ]
        [
          ''
            bash ${spotx} -f -P "$out/share/spotify"
            runHook postInstall
          ''
        ]
        old.installPhase;
  });
}
