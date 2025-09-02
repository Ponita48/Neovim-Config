return {
    {
        "Ponita48/joni.nvim",
        dependency = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("joni").setup()
        end,
    }
}
