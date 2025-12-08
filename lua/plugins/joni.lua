return {
    {
        "Ponita48/joni.nvim",
        dependency = {
            "nvim-telescope/telescope.nvim",
            "leafo/etlua"
        },
        config = function()
            require("joni").setup()
        end,
    }
}
