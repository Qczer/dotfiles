local map = vim.keymap.set

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z<Cmd>delmarks z<CR>")

map("x", "<leader>p", "\"_dP")

map({'n', 'v', 'o'}, "'", "`", { noremap = true })
map({'n', 'v', 'o'}, "`", "'", { noremap = true })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
