vim.o.backup = false                          -- creates a backup file
vim.o.updatetime = 300                        -- faster completion (4000ms default)
vim.o.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.o.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.o.splitbelow = true                       -- force all horizontal splits to go below current window
vim.o.splitright = true                       -- force all vertical splits to go to the right of current window
vim.o.swapfile = false                        -- creates a swapfile
vim.o.timeoutlen = 400                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.hlsearch = true                    -- highlight all matches on previous search pattern
vim.o.ignorecase = true                       -- ignore case in search patterns
vim.o.mouse = "a"                             -- allow the mouse to be used in neovim
vim.o.pumheight = 10                        -- pop up menu height
vim.o.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.o.showtabline = 2                         -- always show tabs
vim.o.smartcase = true                        -- smart case
vim.o.swapfile = false                        -- creates a swapfile
vim.o.completeopt = "menuone", "noselect"   -- mostly just for cmp

vim.bo.fileencoding = "utf-8"                  -- the encoding written to a file
vim.bo.smartindent = true                      -- make indenting smarter again
vim.bo.undofile = true                         -- enable persistent undo
vim.bo.expandtab = true                       -- convert tabs to spaces
vim.bo.shiftwidth = 2                         -- the number of spaces inserted for each indentation
vim.bo.tabstop = 2                             -- insert 2 spaces for a tab

vim.wo.cursorline = true                       -- highlight the current line
vim.wo.numberwidth = 4                        -- set number column width to 2 {default 4}
vim.wo.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.wo.conceallevel=2                        -- so that `` is visible in markdown files
vim.wo.wrap = false                         -- display lines as one long line
vim.wo.scrolloff = 8                           -- is one of my fav
vim.wo.sidescrolloff = 8
vim.wo.number = true                           -- set numbered lines
vim.wo.relativenumber = true                  -- set relative numbered lines
-- vim.wo.guifont = "monospace:h17"               -- the font used in graphical neovim applications


vim.g.airline_powerline_fonts = 1

--Remap space as leader key
vim.g.mapleader = " "
-- vim.cmd [[
-- set tabstop=2
-- set shiftwidth=3
-- set expandtab
-- ]]

