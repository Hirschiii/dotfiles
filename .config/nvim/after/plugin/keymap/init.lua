local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>f", ":NvimTreeToggle<CR>")
nnoremap("<leader>F", ":NvimTreeFocus<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
-- nnoremap("<leader>y", "\"+y")
-- vnoremap("<leader>y", "\"+y")
-- nmap("<leader>Y", "\"+Y")

-- Maps Esc to jj
inoremap("jf", "<Esc>")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

nnoremap("<f8>", ":TagbarToggle<CR>")

-- Emment

vim.g.user_emmet_leader_key="<C-s>"

-- Easy Aligne

-- nmap("ga", <Plug>EasyAlign)
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
vim.keymap.set("v", "ga", "<Plug>(EasyAlign)")

-- Copilot

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
