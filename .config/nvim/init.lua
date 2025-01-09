local vim = vim
local Plug = vim.fn['plug#']

vim.call("plug#begin")

Plug("catppuccin/nvim", { ["as"]  = 'catppuccin' })

Plug("nvim-tree/nvim-tree.lua")
Plug("nvim-tree/nvim-web-devicons")
Plug("romgrk/barbar.nvim")
Plug('nvim-lualine/lualine.nvim')
Plug("nvim-treesitter/nvim-treesitter", {["do"] = ":TSUpdate"})
Plug("neovim/nvim-lspconfig")
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
Plug("saadparwaiz1/cmp_luasnip")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", {["tag"] = "0.1.4"})
Plug("ibhagwan/fzf-lua", {["branch"] = "main"})

vim.call("plug#end")

home = os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path

require "common"
require "theme"
require "vimtree"
require "mappings"
require "barbar_config"
require "lualine_config"
require "treesitter_config"
require "lsp_config"
require "cmp_config"
require "telescope_config"

-- highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- fix the color scheme for selected file barbar
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "BufferCurrent", {fg = "black"})
	end,
})
