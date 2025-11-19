{ config, lib, ... }:
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
    environment = {
      DATABASE_URL = "postgresql://litellm@/litellm";
    };

    settings = {
      general_settings = {
      };

      model_list = [
        {
          model_name = "openrouter/*";
          litellm_params =
            let
              inherit (config.services.hermux.listen) address port;
            in
            {
              model = "openrouter/*";
              api_base = "http://${address}:${toString port}/api/v1";
            };
        }
      ]
      ++ modelOllama;
    };
  };

  systemd.services.litellm.serviceConfig = {
    DynamicUser = lib.mkForce false;
    User = "litellm";
    Group = "litellm";
  };

  users.users.litellm = {
    isSystemUser = true;
    group = "litellm";
    description = "LiteLLM service user";
    home = config.services.litellm.stateDir;
  };

  users.groups.litellm = { };

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
