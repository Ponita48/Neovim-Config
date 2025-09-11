return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio"
        },
        keys = {
            { "<leader>bt", ":DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            dap.configurations.dart = {
                {
                    type = "dart",
                    request = "launch",
                    name = "Launch dart",
                    dartSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/dart", -- ensure this is correct
                    flutterSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/flutter",
                    program = "${workspaceFolder}/lib/main.dart",                          -- ensure this is correct
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter",
                    dartSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/dart",       -- ensure this is correct
                    flutterSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/flutter", -- ensure this is correct
                    program = "${workspaceFolder}/lib/main.dart",                                -- ensure this is correct
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter (dev)",
                    dartSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/dart",       -- ensure this is correct
                    flutterSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/flutter", -- ensure this is correct
                    program = "${workspaceFolder}/lib/main.dart",                                -- ensure this is correct
                    cwd = "${workspaceFolder}",
                    toolArgs = { "--flavor", "dev" }
                },
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter (staging)",
                    dartSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/dart",       -- ensure this is correct
                    flutterSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/flutter", -- ensure this is correct
                    program = "${workspaceFolder}/lib/main.dart",                                -- ensure this is correct
                    cwd = "${workspaceFolder}",
                    toolArgs = { "--flavor", "staging" }
                },
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter (Production)",
                    dartSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/dart",       -- ensure this is correct
                    flutterSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/flutter", -- ensure this is correct
                    program = "${workspaceFolder}/lib/main.dart",                                -- ensure this is correct
                    cwd = "${workspaceFolder}",
                    toolArgs = { "--flavor", "production" }
                },
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter (dev) - Modularization",
                    dartSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/dart",       -- ensure this is correct
                    flutterSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/flutter", -- ensure this is correct
                    program = "${workspaceFolder}/example/lib/main.dart",                        -- ensure this is correct
                    cwd = "${workspaceFolder}/example",
                    toolArgs = { "--flavor", "dev" }
                },
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter (staging) - Modularization",
                    dartSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/dart",       -- ensure this is correct
                    flutterSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/flutter", -- ensure this is correct
                    program = "${workspaceFolder}/example/lib/main.dart",                        -- ensure this is correct
                    cwd = "${workspaceFolder}/example",
                    toolArgs = { "--flavor", "staging" }
                },
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter (Production) - Modularization",
                    dartSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/dart",       -- ensure this is correct
                    flutterSdkPath = "/Users/dwikinurkurniawan/development/flutter/bin/flutter", -- ensure this is correct
                    program = "${workspaceFolder}/example/lib/main.dart",                        -- ensure this is correct
                    cwd = "${workspaceFolder}/example",
                    toolArgs = { "--flavor", "production" }
                },
            }
            -- Dart CLI adapter (recommended)
            dap.adapters.dart = {
                type = 'executable',
                command = 'dart',
                args = { 'debug_adapter' },
            }
            dap.adapters.flutter = {
                type = 'executable',
                command = 'flutter',
                args = { 'debug_adapter' },
            }

            -- auto open/close dapui
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
}
