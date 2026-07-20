-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z<Cmd>delmarks z<CR>')
map('n', '<leader>fs', vim.cmd.ClangdSwitchSourceHeader, { desc = 'Switch Source/Header' })

map({ 'n', 'v', 'o' }, "'", '`', { noremap = true })
map({ 'n', 'v', 'o' }, '`', "'", { noremap = true })

map('i', 'jj', '<Esc>')
map('i', 'jk', '<Esc>')

map('x', '<leader>p', '"_dP')

map('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
