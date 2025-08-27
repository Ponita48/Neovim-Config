-- Default Options
vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.termguicolors = true

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Indentation
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.colorcolumn = "80"

-- Color Scheme
vim.cmd("colorscheme rose-pine")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

