{
  lib,
  stdenv,
  fetchurl,
}:

stdenv.mkDerivation rec {
  pname = "tailcloakify";
  version = "1.1.18";

  src = fetchurl {
    url = "https://github.com/ALMiG-Kompressoren-GmbH/tailcloakify/releases/download/v${version}/keycloak-theme-for-kc-22-to-25.jar";
    sha256 = "sha256-dmB4z9CnPzzq+RzM6WKIt83sr1xKxQsJbSoI1bFcxRQ=";
  };

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/providers
    cp $src $out/providers/tailcloakify-${version}.jar
  '';

  meta = with lib; {
    description = "Tailwind CSS based theme for Keycloak";
    homepage = "https://github.com/ALMiG-Kompressoren-GmbH/tailcloakify";
    license = licenses.asl20;
    platforms = platforms.all;
    maintainers = with lib.maintainers; [
      c2fc2f
    ];
  };
}
