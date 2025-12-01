{
  lib,
  callPackage,
  buildEnv,
}:

buildEnv {
  name = "gravitee-api-management";
  paths = [
    (callPackage ./gravitee-api-management.nix { })
  ];

  meta = with lib; {
    mainProgram = "gravitee";
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
}
