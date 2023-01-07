vim.cmd([[
augroup _markdown
  autocmd!
  autocmd FileType markdown setlocal spelllang=de spell
augroup end
]])
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1

-- vim.cmd([[

-- " let g:pandoc#syntax#conceal#urls=1
-- " let g:pandoc#filetypes#pandoc_markdown=1
--
--
-- "" if has("autocmd")
-- "     augroup templates
-- ""         autocmd BufNewFile *.md 0r ~/notes/Resources/Templates/markdown.md
-- ""     augroup END
-- "" endif
-- ]])
