return {
    { "neovim/nvim-lspconfig",
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
            vim.lsp.config("lua_ls", {})
            vim.lsp.config("pylsp", {})

            vim.keymap.set("n", "<leader>zz", function() vim.lsp.buf.format() end, { desc = "Format Code" })
            vim.keymap.set("n", "<leader>oi", function() vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true }) end, { desc = "Optimize Imports" })
            vim.keymap.set("n", "<C-CR>", function() vim.lsp.buf.code_action() end, { desc = "Code Action" })
            
            vim.keymap.set("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Go To Next Error" })
            vim.keymap.set("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Go To Next Error" })

            vim.keymap.set("n", "]w", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARNING }) end, { desc = "Go To Next Warning" })
            vim.keymap.set("n", "[w", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARNING }) end, { desc = "Go To Next Warning" })
        end,
    },
}
