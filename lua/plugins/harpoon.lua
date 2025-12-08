return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>a", function() require("harpoon"):list():add() end,     desc = "Add To Harpoon List" },
    { "<C-1>",     function() require("harpoon"):list():select(1) end, desc = "Harpoon - Select 1" },
    { "<C-2>",     function() require("harpoon"):list():select(2) end, desc = "Harpoon - Select 2" },
    { "<C-3>",     function() require("harpoon"):list():select(3) end, desc = "Harpoon - Select 3" },
    { "<C-4>",     function() require("harpoon"):list():select(4) end, desc = "Harpoon - Select 4" },
    { "<C-5>",     function() require("harpoon"):list():select(5) end, desc = "Harpoon - Select 5" },
    { "<leader>hn",     function() require("harpoon"):list():prev() end, desc = "Harpoon - Select Next" },
    { "<leader>hp",     function() require("harpoon"):list():next() end, desc = "Harpoon - Select Prev" },
    {
      "<leader>hl",
      function()
        local harpoon = require("harpoon")

        harpoon.ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "See Harpoon List"
    },
  },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED
  end
}
