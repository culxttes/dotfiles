require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map('n', '<leader>tt', function ()
  require('base46').toggle_transparency()
end, { desc = 'Toggle Transparency'})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
