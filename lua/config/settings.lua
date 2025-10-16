-- Default Options
vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50
vim.opt.ignorecase = true
vim.opt.wrap = false

-- Indentation
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.colorcolumn = "80"

-- Color Scheme
vim.cmd("colorscheme darcula-dark")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "Folded", { link = "Normal" })

-- LSP related
vim.diagnostic.config({ virtual_text = true })

-- Undotree
vim.opt.swapfile = false
vim.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Fold Related
function IdeaFoldText()
  local startLine = vim.fn.getline(vim.v.foldstart)
  local endLine = vim.v.foldend
  local lineCount = endLine - vim.v.foldstart + 1

  return startLine .. " ... (" .. lineCount .. " lines)" 
end
--
vim.opt.foldtext = "v:lua.IdeaFoldText()"
vim.opt.foldlevel = 1
vim.opt.fillchars = { fold = " " }

