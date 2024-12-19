return {
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_view_zathura_check_libsynctex = false
      vim.g.vimtex_compiler_clean_paths = {
        '_minted*'
      }
      vim.g.vimtex_compiler_latexmk_engines = {
        _ = '-lualatex'
      }
      vim.g.vimtex_compiler_latexmk = {
        options = {
          '-verbose',
          '-synctex=1',
          '-interaction=nonstopmode',
          '-file-line-error',
          '-pretex="cat $S > /tmp/test"',
        }
      }
    end,
  },
}
