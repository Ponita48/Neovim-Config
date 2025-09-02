-- normal mode
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>tt", ":split | terminal<CR>")
vim.keymap.set("n", "gp", function() vim.lsp.buf.hover({ border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" } }) end)
vim.keymap.set("n", "<leader>fn", function() vim.lsp.buf.format() end)

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
