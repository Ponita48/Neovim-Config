return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_preview_options = {
              uml = {
                server = "http://localhost:8005"
              }
            }
            vim.g.mkdp_refresh_slow = 1
        end,
        ft = { "markdown" },
    },
}
