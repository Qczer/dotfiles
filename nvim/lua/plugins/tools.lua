return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'clang-format',
        'codelldb',
      },
    },
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      local dap = require('dap')

      require('mason-nvim-dap').setup({
        ensure_installed = {
          'codelldb',
        },
        automatic_installation = true,
      })

      require('dapui').setup()
      require('nvim-dap-virtual-text').setup()

      dap.adapters.codelldb = {
        type = 'server',
        port = '${port}',
        executable = {
          command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb.exe',
          args = { '--port', '${port}' },
        },
      }

      dap.configurations.cpp = {
        {
          name = 'Launch C++',
          type = 'codelldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      dap.listeners.after.event_initialized['dapui'] = function()
        require('dapui').open()
      end

      dap.listeners.before.event_terminated['dapui'] = function()
        require('dapui').close()
      end

      dap.listeners.before.event_exited['dapui'] = function()
        require('dapui').close()
      end
    end,
  },
}
