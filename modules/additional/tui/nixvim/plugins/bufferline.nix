{ username, ... }:

{
  home-manager.users.${username}.programs.nixvim.plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        offsets = [
          {
            filetype = "NvimTree";
            text = "File Explorer";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };
    };
  };
}
