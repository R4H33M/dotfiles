local nvim_lsp = require("lspconfig")
local map = vim.api.nvim_set_keymap

-- Mappings

local opts = { noremap = true, silent = true }
-- Go to definition
map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Type Definition, disabled because it doesn't look very good right now
-- map("n", "<space>D", "<cmd> lua vim.lsp.buf.type_definition()<CR>", opts)

-- Rename Symbol
map("n", "<space>rn", "<cmd> lua vim.lsp.buf.rename()<CR>", opts)

--[[ Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function ()
		vim.lsp.buf.format({
			async = false,
		})
	end,
})
]] --

local servers = {
	"lua_ls",
	"pyright",
	"rust_analyzer"
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capabilities = capabilities,
	})
end
