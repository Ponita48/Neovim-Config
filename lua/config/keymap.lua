-- normal mode
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>tt", ":split | terminal<CR>")
vim.keymap.set("n", "gp", function()
    vim.lsp.buf.hover(
        {
            border = { "↖", "─", "┐", "│", "┘", "─", "└", "│"
            }
        })
end)

-- insert mode

-- visual mode
vim.keymap.set("v", "$1", "<esc>`>a)<esc>`<i(<esc>", { noremap = true })
vim.keymap.set("v", "$2", "<esc>`>a]<esc>`<i[<esc>", { noremap = true })
vim.keymap.set("v", "$3", "<esc>`>a}<esc>`<i{<esc>", { noremap = true })
vim.keymap.set("v", "$\"", "<esc>`>a\"<esc>`<i\"<esc>", { noremap = true })
vim.keymap.set("v", "$'", "<esc>`>a'<esc>`<i'<esc>", { noremap = true })
vim.keymap.set("v", "$e", "<esc>`>a`<esc>`<i`<esc>", { noremap = true })

-- terminal mode
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { noremap = true })
