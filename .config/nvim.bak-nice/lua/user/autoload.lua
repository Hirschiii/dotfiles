vim.cmd [[
 augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  au BufRead,BufNewFile *.heex set filetype=heex.html


  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup SCSS_compile
    au!
    autocmd filetype scss setlocal makeprg=sass
  augroup END
]]

--   ""{{{
--   let g:sass_compile_auto = 1
--   let g:sass_compile_cdloop = 5
--   let g:sass_compile_cssdir = ['css', 'stylesheet']
--   let g:sass_compile_file = ['scss', 'sass']
--   let g:sass_compile_beforecmd = ''
--   let g:sass_compile_aftercmd = ''
--   autocmd FileType less,sass  setlocal sw=2 sts=2 ts=2 et
--   au! BufWritePost * SassCompile
-- "}}}
-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end

  -- augroup pandoc_syntax
  --   au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
  -- augroup END
--
  -- augroup _markdown
  --   autocmd!
  --   autocmd FileType markdown setlocal wrap
  --   autocmd filetype markdown syn region match start=/\\$\\$/ end=/\\$\\$/
  --   autocmd filetype markdown syn match math '\\$[^$].\{-}\$'
  -- augroup end
