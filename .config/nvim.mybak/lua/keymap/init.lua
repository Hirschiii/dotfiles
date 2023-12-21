local bind = require("keymap.bind")

local nmap = bind("n", { noremap = false })
local nnoremap = bind("n")
local vnoremap = bind("v")
local xnoremap = bind("x")
local inoremap = bind("i")

-- local options = { noremap = true }

vim.g.mapleader = " "
nmap("<leader>pv", vim.cmd.Ex)

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nmap("J", "mzJ`z")
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- nmap("<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- nmap("<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
nmap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nmap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")
inoremap("jf", "<Esc>", { noremap = true })

nmap("Q", "<nop>")
nmap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
nmap("<leader>f", function()
    vim.lsp.buf.format { timeout_ms = 2000 }
end)

-- nmap("<C-k>", "<cmd>cnext<CR>zz")
-- nmap("<C-j>", "<cmd>cprev<CR>zz")
-- " move among buffers with CTRL
nmap("<C-k>", "<cmd>bnext<CR>zz")
nmap("<C-j>", "<cmd>bprev<CR>zz")

nmap("<leader>k", "<cmd>lnext<CR>zz")
nmap("<leader>j", "<cmd>lprev<CR>zz")

nmap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nmap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

nmap("ga", "<Plug>(EasyAlign)")
vnoremap("ga", "<Plug>(EasyAlign)")


-- nnoremap("<C-f>", function()
--     local t = os.execute("/home/niklas/scripts/ink.py " .. vim.fn.expand('%:r')  .. " " .. vim.api.nvim_get_current_line())
--     print(t)
-- end)

-- vim.cmd [[
-- nnoremap <C-f> :exec '.!~/scripts/ink.py %:r "'.getline(".").'"'
-- ]]

inoremap("<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
inoremap("<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")

nmap("<leader>zz", function()
    vim.cmd[[:Goyo]]
    vim.wo.wrap = false
    ColorMyPencils()
end)

-- Zettelkasten

nmap('<leader>pn', "<cmd>ZkNotes<CR>")


-- telescope

nnoremap("<leader>pb", function()
    require("telescope.builtin").buffers()
end)
nnoremap("<Leader>po", function()
    require("telescope.builtin").find_files()
end)
nnoremap("<leader>pw", function()
    require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }
end)

nnoremap("<leader>pg", function ()
    require("telescope.builtin").live_grep()
end)

nnoremap("<leader>ph", function ()
    require("telescope.builtin").help_tags()
end)

nnoremap("<leader>pf", function()
    require("telescope").extensions.frecency.frecency({})
end)

nnoremap("<leader>pu", function ()
    require("telescope").extensions.undo.undo()
end)

nnoremap("<leader>pu", function ()
    require("telescope").extensions.undo.undo()
end)
