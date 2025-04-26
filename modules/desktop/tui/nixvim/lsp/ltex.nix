{ config, ... }:

{
  plugins.lsp.servers.ltex = {
    enable = true;

    settings = {
      ltex = {
        additionalRules = {
          enablePickyRules = true;
        };
        motherTongue = "fr";
        languageToolHttpServerUri = "https://api.languagetoolplus.com/";
        languageToolOrg = {
          apiKey = "vim.fn.readfile(${config.sops.secrets."language-tool/apiKey".path})";
          username = "vim.fn.readfile(${config.sops.secrets."language-tool/username".path})";
        };
        language = "fr";
        completionEnabled = true;
        diagnosticSeverity = "warning";
      };
    };
  };
}
