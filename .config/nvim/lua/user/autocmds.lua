-- properly detect markdown
vim.cmd[[
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown syntax=markdown
]]
