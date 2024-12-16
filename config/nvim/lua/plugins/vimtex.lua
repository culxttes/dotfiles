return {
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.maplocalleader = ","
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_clean_paths = {
        '_minted*'
      }
      vim.g.vimtex_compiler_latexmk = { 
        options = {
          '-verbose',
          '-synctex=1',
          '-interaction=nonstopmode',
          '-file-line-error',
          '-lualatex',
        }
      }
    end,
  },
}
