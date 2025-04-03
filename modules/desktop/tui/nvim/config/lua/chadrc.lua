-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme_toggle = { "ayu_light", "gatekeeper" },
  theme = "ayu_light",
  transparency = true;
}

M.mason = {
  pkgs = {
    "rust-analyzer",
    "codelldb",
    "clangd",
    "ltex-ls",
  }
}

return M
