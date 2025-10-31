{
  services.ollama = {
    enable = true;
    loadModels = [
      "qwen3:8b"
      "mistral:7b"
      "embeddinggemma:latest"
      "qwen3-embedding:latest"
    ];
  };

  services.open-webui = {
    enable = true;
    port = 3380;
    host = "127.0.0.208";
  };
}
