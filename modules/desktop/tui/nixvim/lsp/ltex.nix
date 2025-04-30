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
          apiKey.__raw = ''
            io.open("${config.sops.secrets."language-tool/apiKey".path}", "r"):read("*l")
          ''; 
          username.__raw = ''
            io.open("${config.sops.secrets."language-tool/username".path}", "r"):read("*l")
          ''; 
        };
        language = "fr";
        completionEnabled = true;
        diagnosticSeverity = "warning";
      };
    };
  };
}
