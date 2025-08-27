return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "dart", "java", "kotlin", },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    },
  },
  {"nvim-treesitter/playground"},
}
