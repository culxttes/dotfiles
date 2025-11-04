{
  services.ollama = {
    enable = true;

    host = "127.0.0.1";
    port = 11434;

    environmentVariables = {
      OLLAMA_LLM_LIBRARY = "cpu";
    };

    loadModels = [
      "qwen3:8b"
      "mistral:7b"
      "embeddinggemma:latest"
      "qwen3-embedding:latest"
    ];
  };
}
