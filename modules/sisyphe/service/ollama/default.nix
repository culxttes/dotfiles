{
  services.ollama = {
    enable = true;
    loadModels = [
      "qwen3:8b"
      "mistral:7b"
    ];
  };

  services.open-webui = {
    enable = false;
    port = 3380;
    host = "127.0.0.208";
  };
}
