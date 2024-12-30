-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme_toggle = { "chadracula", "github_light" },
  theme = "chadracula",
  transparency = true,

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.mason = {
    pkgs = {
    "rust-analyzer",
    "codelldb",
  }
}

return M
