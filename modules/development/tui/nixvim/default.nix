{ pkgs, username, ... }:

{
  imports = [
    # keep-sorted start
    ./plugins
    ./secrets
    # keep-sorted end
  ];

  home-manager.users.${username}.programs.nixvim = {
    extraPackages = with pkgs; [
      feh
    ];

    extraConfigLua = ''
      vim.api.nvim_create_autocmd("BufReadPre", {
        pattern = {"*.png", "*.jpg", "*.jpeg", "*.gif", "*.bmp", "*.webp"},
        callback = function(args)
          vim.fn.jobstart({ "feh", args.file }, { detach = true })

          vim.schedule(function()
            vim.api.nvim_buf_delete(args.buf, { force = true })
          end)
        end,
      })

      vim.api.nvim_create_autocmd("BufReadPre", {
        pattern = {"*.pdf"},
        callback = function(args)
          vim.fn.jobstart({ "zathura", args.file }, { detach = true })

          vim.schedule(function()
            vim.api.nvim_buf_delete(args.buf, { force = true })
          end)
        end,
      })
    '';
  };
}
