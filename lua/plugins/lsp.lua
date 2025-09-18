return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        config = function()
            require("lspconfig").lua_ls.setup {}
            require("lspconfig").pylsp.setup {}

            vim.keymap.set("n", "<leader>zz", function() vim.lsp.buf.format() end, { desc = "Format Code" })
            vim.keymap.set("n", "<leader>oi", function() vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true }) end, { desc = "Optimize Imports"})
        end,
    },
}
