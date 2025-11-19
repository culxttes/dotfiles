{
  lib,
  stdenv,
  fetchzip,
  buildEnv,
  makeWrapper,
  jre,
}:
let
  pname = "gravitee-api-management";
  version = "4.9.4";

  src = fetchzip {
    url = "https://download.gravitee.io/graviteeio-apim/distributions/graviteeio-full-${version}.zip";
    sha256 = "sha256-JfNsNUf80DxY3EElfNo6E4RvolQCaRwVZpLbp0VeKDg=";
    stripRoot = false;
  };
in
rec {
  gateway = stdenv.mkDerivation {
    pname = "${pname}-gateway";
    inherit version src;

    nativeBuildInputs = [
      makeWrapper
    ];

    installPhase = ''
      mkdir -p $out/{bin,share/gravitee}

      cp -r graviteeio-full-${version}/graviteeio-apim-gateway-${version}/* \
        $out/share/gravitee

      makeWrapper $out/share/gravitee/bin/gravitee \
        $out/bin/gravitee \
        --set JAVA_HOME ${jre}

      chmod u+x $out/bin/*
    '';

    meta = with lib; {
      description = "Gravitee.io API Management Platform - API Gateway";
      homepage = "https://gravitee.io";
      changelog = "https://github.com/gravitee-io/gravitee-api-management/releases/tag/${version}";
      license = licenses.asl20;
      maintainers = with maintainers; [
        c2fc2f
      ];
      platforms = platforms.unix;
    };
  };

  all = buildEnv {
    name = pname;
    paths = [
      gateway
    ];

    meta = with lib; {
      description = "Gravitee.io API Management Platform";
      longDescription = ''
        Gravitee API Management (APIM) is a flexible, lightweight, and blazing-fast 
        Open Source solution that helps your organization control who, when, and how 
        users access your APIs.

        This package includes:
        - Routes and secures API traffic (port 8082)
        - Management API: Backend REST API for administration (port 8083)
        - Console UI: Management interface for administrators (port 3000)
        - Portal UI: Developer portal for API consumers (port 4100)

        Requirements:
        - MongoDB (required for data persistence)
        - Elasticsearch (optional, for analytics)

        Default credentials: admin / admin
      '';
      homepage = "https://gravitee.io";
      changelog = "https://github.com/gravitee-io/gravitee-api-management/releases/tag/${version}";
      license = licenses.asl20;
      maintainers = with maintainers; [
        c2fc2f
      ];
      platforms = platforms.unix;
    };
  };
}
