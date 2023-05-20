local function bind(op, outer_opts)
    outer_opts = outer_opts or { noremap = true }
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

nmap = bind("n", { noremap = false })
nnoremap = bind("n")
vnoremap = bind("v")
xnoremap = bind("x")
inoremap = bind("i")

local options = { noremap = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")
inoremap("jf", "<Esc>", { noremap = true })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- " move among buffers with CTRL
vim.keymap.set("n", "<C-k>", "<cmd>bnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>bprev<CR>zz")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
vim.keymap.set("v", "ga", "<Plug>(EasyAlign)")


-- nnoremap("<C-f>", function()
--     local t = os.execute("/home/niklas/scripts/ink.py " .. vim.fn.expand('%:r')  .. " " .. vim.api.nvim_get_current_line())
--     print(t)
-- end)

vim.cmd[[
nnoremap <C-f> :exec '.!~/scripts/ink.py %:r "'.getline(".").'"'
]]

inoremap("<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
inoremap("<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")

nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)
nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
