return {
  'Civitasv/cmake-tools.nvim',
  config = function()
    require('cmake-tools').setup({
      cmake_executor = {
        name = 'terminal',
        opts = {
          terminal_close_on_success = false,
          cwd = '${targetFileDir}',
        },
      },
      cmake_runner = {
        name = 'terminal',
        opts = {
          terminal_close_on_success = false,
        },
      },
      cmake_dap_configuration = {
        name = 'cpp',
        type = 'codelldb',
        request = 'launch',
        cwd = '${targetFileDir}',
        stopOnEntry = false,
        runInTerminal = false,
      },
    })
  end,
}
