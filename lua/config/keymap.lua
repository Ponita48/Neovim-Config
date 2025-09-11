-- normal mode
vim.keymap.set("n", "<leader>tt", ":split | terminal<CR>")
vim.keymap.set("n", "gp", function() vim.lsp.buf.hover({ border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" } }) end)
vim.keymap.set("n", "<leader>fn", function() vim.lsp.buf.format() end)
vim.keymap.set("n", "<leader>ps", function() vim.cmd(":NeovimProjectDiscover history") end)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>er", ":LaunchAvd<CR>", { silent = true })

-- insert mode

-- visual mode
vim.keymap.set("v", "$(", "<esc>`>a)<esc>`<i(<esc>", { noremap = true })
vim.keymap.set("v", "$[", "<esc>`>a]<esc>`<i[<esc>", { noremap = true })
vim.keymap.set("v", "${", "<esc>`>a}<esc>`<i{<esc>", { noremap = true })
vim.keymap.set("v", "$\"", "<esc>`>a\"<esc>`<i\"<esc>", { noremap = true })
vim.keymap.set("v", "$'", "<esc>`>a'<esc>`<i'<esc>", { noremap = true })
vim.keymap.set("v", "$e", "<esc>`>a`<esc>`<i`<esc>", { noremap = true })

-- terminal mode
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { noremap = true })
