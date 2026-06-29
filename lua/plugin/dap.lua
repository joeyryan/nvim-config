-- Debug Adapter Protocol support and UI
local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
}

local function executable(name)
  local path = vim.fn.exepath(name)
  if path == "" then
    return nil
  end
  return path
end

local function prompt_program()
  return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
end

local function prompt_args()
  local args = vim.fn.input("Arguments: ")
  return vim.split(args, "%s+", { plain = false, trimempty = true })
end

local function configure_rust_adapters(dap)
  local adapter

  local codelldb = executable("codelldb")
  if codelldb then
    adapter = "codelldb"
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = codelldb,
        args = { "--port", "${port}" },
      },
    }
  end

  local lldb_dap = executable("lldb-dap")
  if not adapter and lldb_dap then
    adapter = "lldb-dap"
    dap.adapters[adapter] = {
      type = "executable",
      command = lldb_dap,
    }
  end

  local lldb_vscode = executable("lldb-vscode")
  if not adapter and lldb_vscode then
    adapter = "lldb-vscode"
    dap.adapters[adapter] = {
      type = "executable",
      command = lldb_vscode,
    }
  end

  local rust_gdb = executable("rust-gdb")
  if not adapter and rust_gdb then
    adapter = "rust-gdb"
    dap.adapters[adapter] = {
      type = "executable",
      command = rust_gdb,
      args = { "-i", "dap" },
    }
  end

  if not adapter then
    vim.notify("No Rust DAP adapter found on PATH", vim.log.levels.WARN)
    return
  end

  dap.configurations.rust = {
    {
      name = "Debug executable",
      type = adapter,
      request = "launch",
      program = prompt_program,
      args = prompt_args,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
    {
      name = "Attach to process",
      type = adapter,
      request = "attach",
      pid = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end

function M.config()
  local dap = require("dap")
  local dapui = require("dapui")

  dapui.setup({
    expand_lines = true,
    icons = { expanded = "", collapsed = "", circular = "" },
    mappings = {
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.33 },
          { id = "breakpoints", size = 0.17 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 0.25 },
        },
        size = 0.33,
        position = "right",
      },
      {
        elements = {
          { id = "repl", size = 0.45 },
          { id = "console", size = 0.55 },
        },
        size = 0.27,
        position = "bottom",
      },
    },
    floating = {
      max_height = 0.9,
      max_width = 0.5,
      border = "single",
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
  })

  require("nvim-dap-virtual-text").setup({
    commented = true,
  })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
  vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
  vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticSignHint", linehl = "Visual", numhl = "" })
  vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

  configure_rust_adapters(dap)
end

return M
