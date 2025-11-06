{
  lib,
  stdenv,
  fetchurl,
}:

stdenv.mkDerivation rec {
  pname = "tailcloakify";
  version = "1.1.3";

  src = fetchurl {
    url = "https://github.com/subtype-space/subcloakify/releases/download/v${version}/keycloak-theme-for-kc-22-to-25.jar";
    sha256 = "sha256-0QNqDFTULgD5buL/1QOemPIq/pCgqwtJxx9BIgoukRE=";
  };

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/providers
    cp $src $out/providers/subcloakify-${version}.jar
  '';

  meta = with lib; {
    description = "Tailwind/shadcn based Keycloak theme built on top of keycloakify ";
    homepage = "https://github.com/subtype-space/subcloakify";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with lib.maintainers; [
      c2fc2f
    ];
  };
}
