return {
  'nvim-flutter/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require('flutter-tools').setup {
      fvm = true,
      debugger = {
          enabled = true,
      },
    }
  end,
}
