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
            vim.lsp.config('lua_ls', {
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if
                            path ~= vim.fn.stdpath('config')
                            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                        then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most
                            -- likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                            -- Tell the language server how to find Lua modules same way as Neovim
                            -- (see `:h lua-module-load`)
                            path = {
                                'lua/?.lua',
                                'lua/?/init.lua',
                            },
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths
                                -- here.
                                -- '${3rd}/luv/library'
                                -- '${3rd}/busted/library'
                            }
                            -- Or pull in all of 'runtimepath'.
                            -- NOTE: this is a lot slower and will cause issues when working on
                            -- your own configuration.
                            -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                            -- library = {
                            --   vim.api.nvim_get_runtime_file('', true),
                            -- }
                        }
                    })
                end,
                settings = {
                }
            })
            vim.lsp.config("tsserver", {
                cmd = { 'typescript-language-server', '--stdio' },
                filetypes = { 'javascript', 'typescript' },
            })

            vim.keymap.set("n", "<leader>zz", function() vim.lsp.buf.format() end, { desc = "Format Code" })
            vim.keymap.set("n", "<leader>oi",
                function() vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true }) end,
                { desc = "Optimize Imports" })
            vim.keymap.set("n", "<C-CR>", function() vim.lsp.buf.code_action() end, { desc = "Code Action" })

            vim.keymap.set("n", "]e",
                function() vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR }) end,
                { desc = "Go To Next Error" })
            vim.keymap.set("n", "[e",
                function() vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.ERROR }) end,
                { desc = "Go To Previous Error" })

            vim.keymap.set("n", "]w",
                function() vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.WARN }) end,
                { desc = "Go To Next Warning" })
            vim.keymap.set("n", "[w",
                function() vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.WARN }) end,
                { desc = "Go To Prev Warning" })

            vim.keymap.set("n", "]i",
                function() vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.INFO }) end,
                { desc = "Go To Next Info" })
            vim.keymap.set("n", "[i",
                function() vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.INFO }) end,
                { desc = "Go To Prev Info" })

            vim.keymap.set("n", "]h",
                function() vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.HINT }) end,
                { desc = "Go To Next Hint" })
            vim.keymap.set("n", "[h",
                function() vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.HINT }) end,
                { desc = "Go To Prev Hint" })
        end,
    },
}
