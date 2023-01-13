vim.cmd([[
    augroup templates
        autocmd BufNewFile *.md 0r ~/notes/Resources/Templates/markdown.md
    augroup END
    augroup templates
        autocmd BufNewFile *.html 0r ~/Documents/Templates/default.html
    augroup END
]])
