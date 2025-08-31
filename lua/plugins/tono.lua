return {
    {
        "Ponita48/tono.nvim",
        dependency = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("tono").setup()
        end,
    }
}
