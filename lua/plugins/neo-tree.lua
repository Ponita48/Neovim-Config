return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,                -- neo-tree will lazily load itself
        config = true,
        opts = {
            window = {
                position = 'right',
            },
        },
        keys = {
            { "<leader>nn", ":Neotree toggle position=left<CR>", desc = "Open File Browser", silent = true },
        },
    }
}
