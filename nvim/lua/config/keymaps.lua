-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local dap = require('dap')
local map = vim.keymap.set

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z<Cmd>delmarks z<CR>')
map({ 'n', 'v', 'o' }, "'", '`', { noremap = true })
map({ 'n', 'v', 'o' }, '`', "'", { noremap = true })

map('n', '<leader>fs', vim.cmd.ClangdSwitchSourceHeader, { desc = 'Switch Source/Header' })
map('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol' })
map('n', '<leader>f/', Snacks.picker.grep, { desc = 'Grep (include all)' })
map('n', '<leader>/', function()
  Snacks.picker.grep {
    exclude = {
      '.git',
      'node_modules',
      '.nuxt',
      '.output',
      'dist',
      'build',
    },
  }
end, { desc = 'Grep (ignore)' })

-- Debugging
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'Open Debug REPL' })
vim.keymap.set('n', '<leader>du', function()
  require('dapui').toggle()
end, { desc = 'Toggle Debug UI' })

map('i', 'jj', '<Esc>')
map('i', 'jk', '<Esc>')

map('x', '<leader>p', '"_dP')

map('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
