vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.showmode = false

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true -- show line below cursor

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

if vim.env.SSH_CONNECTION or vim.env.SSH_TTY then vim.g.clipboard = "osc52" end
-- split windows
opt.splitright = true
opt.splitbelow = true

vim.o.winbar = " "

opt.undofile = true
