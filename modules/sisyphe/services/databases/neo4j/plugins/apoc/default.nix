{
  stdenv,
  lib,
  fetchurl,
}:

stdenv.mkDerivation rec {
  pname = "apoc";
  version = "5.26.18";

  src = fetchurl {
    url = "https://github.com/neo4j/apoc/releases/download/${version}/apoc-${version}-core.jar";
    sha256 = "sha256-nuDp6cJML5iQXAXI7xMd68P/VjvF8LCBIs3m/9KZ3ZA=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p "$out/share/neo4j"
    cp $src "$out/share/neo4j"
  '';

  meta = with lib; {
    description = "Awesome Procedures for Neo4j.";
    homepage = "https://github.com/neo4j/apoc";
    license = licenses.asl20;
    maintainers = with maintainers; [ c2fc2f ];
    platforms = platforms.unix;
  };
}
