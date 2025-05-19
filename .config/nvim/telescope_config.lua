local keymap = vim.keymap.set
local fzf_lua = require("fzf-lua")

-- temporarily disable git_icons because i am using sshfs
fzf_lua.setup{
	files = {
		git_icons = false,
	},
	git = {
		git_icons = false,
	},
	grep = {
		git_icons = false,
	},
	lsp = {
		git_icons = false,
	}
}

keymap("n", "<leader>sf", fzf_lua.files, {desc = "[S]earch [F]iles" })

keymap("n", "<leader>sg", fzf_lua.live_grep, {desc = "[S]earch by [G]rep"})

keymap("n", "<leader>sd", fzf_lua.diagnostics_document, {desc = "[S]earch [D]iagnostics"})

keymap("n", "<leader>ds", fzf_lua.lsp_document_symbols, {desc = "[D]ocument [S]ymbols"})

