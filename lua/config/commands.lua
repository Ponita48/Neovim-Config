local function launch_avd()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local config_values = require("telescope.config").values
    local themes = require("telescope.themes");

    local android_sdk = vim.fn.expand(vim.fn.expand(vim.env.ANDROID_HOME or vim.g.android_sdk))
    local emulator = android_sdk .. "/emulator/emulator"

    local avds_obj = vim.system({ emulator, "-list-avds" }, {}):wait()
    if avds_obj.code ~= 0 then
        vim.notify("Cannot read emulators", vim.log.levels.WARN, {})
        return
    end

    local read = avds_obj.stdout or ""
    local avds = {}
    for line in read:gmatch("[^\r\n]+") do
        table.insert(avds, line)
    end
    table.remove(avds, 1)

    pickers.new(themes.get_dropdown(), {
        prompt_title = "AVD to Start",
        finder = finders.new_table(avds),
        sorter = config_values.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                if not selection then return end
                actions.close(prompt_bufnr)

                vim.notify("Device selected: " .. selection.value .. ". Launching!", vim.log.levels.INFO, {})
                vim.system({ emulator, "@" .. selection.value }, { text = true }, vim.schedule_wrap(function(obj)
                    if obj.code ~= 0 then
                        vim.notify("Launch failed: " .. obj.stderr, vim.log.levels.WARN, {})
                    end
                end))
            end)

            return true
        end,
    }):find()
end

vim.api.nvim_create_user_command(
    "RunEmulator",
    function() launch_avd() end,
    { desc = "Run AVD Emulator with telescope picker" }
)

vim.api.nvim_create_autocmd("User", {
    pattern = "SessionLoadPost",
    callback = function()
        vim.lsp.stop_client(vim.lsp.get_clients())

        vim.cmd("doautocmd FileType")
    end
})
