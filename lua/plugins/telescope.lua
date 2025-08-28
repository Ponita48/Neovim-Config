return {
    { 
        'nvim-telescope/telescope.nvim' , 
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            extensions = {
                hijack_netrw = true,
            },
        },
        keys = {
            { "<leader>nn", function() require('telescope').extensions.file_browser.file_browser() end, desc = "" },
            { "<leader>ff", function() require('telescope.builtin').find_files() end, desc = "Find Files" },
            { "<C-p>", function() require('telescope.builtin').git_files() end, desc = "Find Git Files" },
            { "<leader>tf", function() require('telescope.builtin').treesitter() end, desc = "Treesitter Files" },
            { 
                "<leader>fs", 
                function() 
                    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
                end,
                desc = "Find String in Files",
            },
        },

    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').load_extension('file_browser')
        end,
    },
}
