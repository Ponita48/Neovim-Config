return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio"
    },
    keys = {
      { "<leader>bt",  ":DapToggleBreakpoint<CR>",                                                     desc = "Toggle Breakpoint" },
      { "<leader>bc",  ":DapContinue<CR>",                                                             desc = "Continue Execution" },
      { "<leader>bR",  function() require('dap').restart() end,                                        desc = "Restart Execution" },
      { "<leader>bqq", function() require('dap').terminate() end,                                      desc = "Stop Execution" },
      { "<leader>bso", function() require('dap').step_over() end,                                      desc = "Step Over" },
      { "<leader>bsi", function() require('dap').step_into() end,                                      desc = "Step Into" },
      { "<leader>bsq", function() require('dap').step_out() end,                                       desc = "Step Out" },
      { "<leader>bsb", function() require('dap').step_back() end,                                      desc = "Step Back" },
      { "<leader>duo", function() require('dapui').open() end,                                         desc = "Show DAP UI" },
      { "<leader>duc", function() require('dapui').close() end,                                        desc = "Close DAP UI" },
      { "<leader>dut", function() require('dapui').toggle() end,                                       desc = "Toggle DAP UI" },
      { "<leader>de",  function() require('dapui').elements.watches.add(vim.fn.expand('<cword>')) end, desc = "Watch cWORD" },
      {
        "<leader>br",
        function()
          local session = require('dap').session()
          if session then
            session:request("hotReload", nil, function(err, _)
              if err then
                vim.notify("Hot reload error: " .. err.message, vim.log.levels.ERROR)
              else
                vim.notify("Hot reload success")
              end
            end)
          else
            vim.notify("No active dap session", vim.log.levels.WARN)
          end
        end,
        desc = "Hot Reload"
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        layouts = {
          {
            elements = {
              "scopes",
              "breakpoints",
              "stacks",
            },
            size = 30, -- default = 40
            position = "left",
          },
          {
            elements = {
              "watches",
              "repl", -- keep the REPL
              -- removed "console"
            },
            size = 10,
            position = "bottom",
          },
        },
      })

      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch dart",
          program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
          cwd = "${workspaceFolder}",
        },
        {
          type = "flutter",
          request = "launch",
          name = "Launch flutter",
          program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
          cwd = "${workspaceFolder}",
        },
        {
          type = "flutter",
          request = "launch",
          name = "Launch flutter (dev)",
          program = "${workspaceFolder}/lib/main_dev.dart", -- ensure this is correct
          cwd = "${workspaceFolder}",
          toolArgs = { "--flavor", "dev" }
        },
        {
          type = "flutter",
          request = "launch",
          name = "Launch flutter (staging)",
          program = "${workspaceFolder}/lib/main_staging.dart", -- ensure this is correct
          cwd = "${workspaceFolder}",
          toolArgs = { "--flavor", "staging" }
        },
        {
          type = "flutter",
          request = "launch",
          name = "Launch flutter (Production)",
          program = "${workspaceFolder}/lib/main_production.dart", -- ensure this is correct
          cwd = "${workspaceFolder}",
          toolArgs = { "--flavor", "production", "--debug" }
        },
        {
          type = "flutter",
          request = "launch",
          name = "Launch flutter (dev) - Modularization",
          program = "${workspaceFolder}/example/lib/main_dev.dart", -- ensure this is correct
          cwd = "${workspaceFolder}/example",
          toolArgs = { "--flavor", "dev" }
        },
        {
          type = "flutter",
          request = "launch",
          name = "Launch flutter (staging) - Modularization",
          program = "${workspaceFolder}/example/lib/main_staging.dart", -- ensure this is correct
          cwd = "${workspaceFolder}/example",
          toolArgs = { "--flavor", "staging" }
        },
        {
          type = "flutter",
          request = "launch",
          name = "Launch flutter (Production) - Modularization",
          program = "${workspaceFolder}/example/lib/main_production.dart", -- ensure this is correct
          cwd = "${workspaceFolder}/example",
          toolArgs = { "--flavor", "production", "--debug" }
        },
        {
          type = "dart",
          request = "launch",
          name = "Run Test (Current File)",
          program = "${file}", -- ensure this is correct
          cwd = "${workspaceFolder}",
        },
      }

      -- Prioritize FVM dir instead of Flutter global
      local function find_fvm_flutter()
        local dir = vim.fn.expand("%:p:h")
        local fvm_dir = vim.fn.finddir(".fvm/flutter_sdk/bin", dir .. ";")
        if fvm_dir ~= "" then
          return fvm_dir .. "/flutter"
        end
        return "flutter"
      end

      -- Dart CLI adapter (recommended)
      dap.adapters.dart = {
        type = 'executable',
        command = 'dart',
        args = { 'debug_adapter' },
      }
      dap.adapters.flutter = {
        type = 'executable',
        command = find_fvm_flutter(),
        args = { 'debug_adapter' },
      }

      dap.defaults.fallback.exception_breakpoints = {}

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

      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.dart",
        callback =
            function()
              local session = require('dap').session()
              if session then
                session:request("hotReload", nil, function(err, _)
                  if err then
                  else
                    vim.notify("Hot reload success")
                  end
                end)
              end
            end,
      })
    end,
  },
}
