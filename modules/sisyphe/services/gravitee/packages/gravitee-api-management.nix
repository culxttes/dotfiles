{
  lib,
  stdenv,
  fetchzip,
  makeWrapper,
  jre,
}:

stdenv.mkDerivation rec {
  pname = "gravitee-api-management-gateway";

  version = "4.9.7";

  src = fetchzip {
    url = "https://download.gravitee.io/graviteeio-apim/distributions/graviteeio-full-${version}.zip";
    sha256 = "sha256-JfNsNUf80DxY3EElfNo6E4RvolQCaRwVZpLbp0VeKDg=";
    stripRoot = false;
  };

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
}
