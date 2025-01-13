vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set('i', '<S-Return>', '<Esc>o', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>',
    { noremap = true, silent = true })

local map = vim.api.nvim_set_keymap
local opts = {}
map('n', '<leader>/', 'gcc', opts)
map('v', '<leader>/', 'gc', opts)
