{ pkgs, username, ... }:

{
  imports = [
    ./plugins
  ];

  home-manager.users.${username}.programs.nixvim = {
    extraPackages = with pkgs; [
      feh
    ];

    extraConfigLua = ''
      vim.api.nvim_create_autocmd("BufReadPre", {
        pattern = {"*.png", "*.jpg", "*.jpeg", "*.gif", "*.bmp", "*.webp"},
        callback = function(args)
          local file = args.file
          vim.fn.jobstart({ "feh", file }, { detach = true })
        end,
      })
    '';
  };
}
