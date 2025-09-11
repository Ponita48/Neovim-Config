return {
    "ariedov/android-nvim",
    config = function()
        require('android-nvim').setup()

        vim.g.android_sdk = "~/Library/Android/sdk"
    end,
}
