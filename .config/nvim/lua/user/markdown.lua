vim.cmd([[
augroup _markdown
  autocmd!
  autocmd FileType markdown setlocal wrap spelllang=de spell
augroup end
]])

vim.g.vim_markdown_math = 1

vim.cmd([[
let g:vimwiki_list = [{
  \ 'auto_export': 0,
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '$HOME/notes/html',
  \ 'path': '$HOME/notes',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_path': '$HOME/.pandoc/templates/',
  \ 'template_default': 'markdown',
  \ 'template_ext': '.html',
  \ 'custom_wiki2html': '$HOME/.local/bin/wiki2html.sh',
  \ 'css_name': "~/notes/Resources/markdown.css"
\}]

let g:pandoc#syntax#conceal#urls=1
let g:pandoc#filetypes#pandoc_markdown=1


"" if has("autocmd")
"     augroup templates
""         autocmd BufNewFile *.md 0r ~/notes/Resources/Templates/markdown.md
""     augroup END
"" endif
]])
