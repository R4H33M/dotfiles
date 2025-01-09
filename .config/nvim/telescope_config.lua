local keymap = vim.keymap.set

keymap("n", "<leader>f", require("fzf-lua").files, {desc = "Fzf files" })

keymap("n", "<leader>g", require("fzf-lua").live_grep, {desc = "Fzf live grep"})


