{ config, ... }:

{
  services.litellm = {
    enable = true;

    settings = {
      model_list = {
        model_name = "[provider] *";
        litellm_params =
          let
            inherit (config.services) ollama;
          in
          {
            model = "ollama/*";
            api_base = "http://${ollama.host}:${ollama.port}";
          };
      };
    };
  };
}
