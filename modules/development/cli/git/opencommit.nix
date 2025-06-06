{ pkgs, username, ... }:
/*
  opencommit, a CLI tool that uses AI to generate conventional commit messages
  based on staged git changes. It helps maintain consistent commit formatting
  and saves time when writing descriptive messages.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.opencommit
    ];

    home.file.".opencommit".text = ''
      OCO_AI_PROVIDER=ollama
      OCO_MODEL=mistral:7b
      OCO_API_URL=https://ollama.sagbot.com/api/chat
      OCO_API_KEY=undefined
      OCO_TOKENS_MAX_INPUT=40960
      OCO_TOKENS_MAX_OUTPUT=4096
      OCO_DESCRIPTION=false
      OCO_EMOJI=false
      OCO_LANGUAGE=en
      OCO_MESSAGE_TEMPLATE_PLACEHOLDER=$msg
      OCO_PROMPT_MODULE=conventional-commit
      OCO_ONE_LINE_COMMIT=false
      OCO_TEST_MOCK_TYPE=commit-message
      OCO_OMIT_SCOPE=false
      OCO_GITPUSH=true
      OCO_WHY=false
    '';
  };
}
