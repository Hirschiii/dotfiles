vim.cmd([[
   augroup _markdown
      autocmd!
      autocmd FileType markdown setlocal wrap spelllang=de spell
   augroup end
]])

vim.g.glow_border = "rounded"
vim.g.vim_markdown_math = 1

-- VimWiki


-- let g:vimwiki_list = [{'path': '~/Notes/', 'syntax': 'markdown', 'ext': '.md'}]

vim.cmd([[
let g:vimwiki_list = [{'path': '~/Notes/',
  \ 'path_html': '~/Documents/Notes_html',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'custom_wiki2html': '~/.local/bin/wiki2html.sh'}]
]])
