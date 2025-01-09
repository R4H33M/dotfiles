require("nvim-treesitter.configs").setup({
	ensure_installed={"lua", "vim", "rust", "python"},
	highlight = {enable = true},
	incremental_selection = {enable = true},
	textobjects = {enable = true},
})
