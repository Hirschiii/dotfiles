-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.opt.mouse=""

vim.opt.errorbells = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")


vim.o.clipboard = "unnamedplus"                 -- allows neovim to global copy
vim.o.smartcase = true                        -- smart case

vim.wo.cursorline = true
vim.wo.wrap = false                         -- display lines as one long line

vim.wo.concealcursor="c"

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")


vim.opt.formatoptions:remove("cro") -- Stop newline continution of comments

vim.cmd[[
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]]


-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- Himalaya

vim.g.himalaya_folder_picker = 'telescope'
vim.g.himalaya_telescope_preview_enabled = 1