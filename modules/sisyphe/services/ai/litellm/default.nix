{
  config,
  pkgs,
  lib,
  ...
}:
let
  modelOllama = lib.map (model: {
    model_name = "ollama_chat/${model}";
    litellm_params =
      let
        inherit (config.services) ollama;
      in
      {
        model = "ollama_chat/${model}";
        api_base = "http://${ollama.host}:${toString ollama.port}";
      };

  }) config.services.ollama.loadModels;
in
{
  imports = [
    # keep-sorted start
    ./secrets
    # keep-sorted end
  ];

  services.litellm = {
    enable = true;

    host = "127.0.0.99";
    port = 3333;

    environmentFile = config.sops.secrets."litellm/environement".path;

    settings = {
      general_settings = {
      };

      model_list = [
        {
          model_name = "openrouter/*";
          litellm_params =
            let
              inherit (config.services) hermux;
            in
            {
              model = "openrouter/*";
              api_base = "http://${hermux.listen.address}:${toString hermux.listen.port}/api/v1";
            };
        }
      ]
      ++ modelOllama;
    };
  };

  services.postgresql = {
    ensureDatabases = [
      "litellm"
    ];
    ensureUsers = [
      {
        name = "litellm";
        ensureDBOwnership = true;
      }
    ];
  };
}
