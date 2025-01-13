vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "120"
vim.cmd.colorscheme("rose-pine-moon")

vim.api.nvim_create_autocmd({"InsertLeave"}, {
    pattern = "*",
    command = "silent! write"
})
