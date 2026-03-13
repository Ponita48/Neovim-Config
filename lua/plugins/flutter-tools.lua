return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  keys = {
    { "<leader>fo", ":FlutterOutlineToggle<CR>", desc = "Toggle Flutter Outline" },
  },
  ft = { "dart" },
  opts = {
    fvm = true,
    debugger = { enabled = true },
    dev_tools = { auto_open_browser = true },
    decorations = {
      statusline = {
        app_version = true,
        device = true,
      }
    },
    lsp = {
      color = {
        enabled = true,
        background_color = { r = 10, g = 10, b = 10 }
      }
    }
  }
}
