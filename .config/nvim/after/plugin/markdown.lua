vim.cmd [[
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
augroup pandoc_syntax
  autocmd! FileType vimwiki set syntax=markdown.pandoc
augroup END
]]

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.md"}, command = "setlocal syntax=markdown.pandoc" }
)
--
-- require('mkdnflow').setup({
--     modules = {
--         bib = true,
--         buffers = true,
--         conceal = true,
--         cursor = true,
--         folds = true,
--         links = true,
--         lists = true,
--         maps = true,
--         paths = true,
--         tables = true
--     },
--     filetypes = {md = true, rmd = true, markdown = true},
--     create_dirs = true,             
--     perspective = {
--         priority = 'first',
--         fallback = 'current',
--         root_tell = false,
--         nvim_wd_heel = true
--     },    
--     wrap = false,
--     bib = {
--         default_path = nil,
--         find_in_root = true
--     },
--     silent = false,
--     links = {
--         style = 'markdown',
--         name_is_source = false,
--         conceal = false,
--         implicit_extension = nil,
--         transform_implicit = false,
--         transform_explicit = function(text)
--             text = text:gsub(" ", "-")
--             text = text:lower()
--             text = os.date('%d-%m-%Y_')..text
--             return(text)
--         end
--     },
--     to_do = {
--         symbols = {' ', '-', 'X'},
--         update_parents = true,
--         not_started = ' ',
--         in_progress = '-',
--         complete = 'X'
--     },
--     tables = {
--         trim_whitespace = true,
--         format_on_move = true,
--         auto_extend_rows = true,
--         auto_extend_cols = false
--     },
--     mappings = {
--         MkdnEnter = {{'i', 'n', 'v'}, '<CR>'},
--         MkdnTab = false,
--         MkdnSTab = false,
--         MkdnNextLink = {'n', '<Tab>'},
--         MkdnPrevLink = {'n', '<S-Tab>'},
--         MkdnNextHeading = {'n', ']]'},
--         MkdnPrevHeading = {'n', '[['},
--         MkdnGoBack = {'n', '<BS>'},
--         MkdnGoForward = {'n', '<Del>'},
--         MkdnFollowLink = false, -- see MkdnEnter
--         MkdnDestroyLink = {'n', '<M-CR>'},
--         MkdnTagSpan = {'v', '<M-CR>'},
--         MkdnMoveSource = {'n', '<F2>'},
--         MkdnYankAnchorLink = {'n', 'ya'},
--         MkdnYankFileAnchorLink = {'n', 'yfa'},
--         MkdnIncreaseHeading = {'n', '+'},
--         MkdnDecreaseHeading = {'n', '-'},
--         MkdnToggleToDo = {{'n', 'v'}, '<C-Space>'},
--         MkdnNewListItem = false,
--         MkdnNewListItemBelowInsert = {'n', 'o'},
--         MkdnNewListItemAboveInsert = {'n', 'O'},
--         MkdnExtendList = false,
--         MkdnUpdateNumbering = {'n', '<leader>nn'},
--         MkdnTableNextCell = {'i', '<Tab>'},
--         MkdnTablePrevCell = {'i', '<S-Tab>'},
--         MkdnTableNextRow = {'i', '<CR>'},
--         MkdnTablePrevRow = {'i', '<S-CR>'},
--         MkdnTableNewRowBelow = {'n', '<leader>ir'},
--         MkdnTableNewRowAbove = {'n', '<leader>iR'},
--         MkdnTableNewColAfter = {'n', '<leader>ic'},
--         MkdnTableNewColBefore = {'n', '<leader>iC'},
--         MkdnFoldSection = {'n', '<leader>f'},
--         MkdnUnfoldSection = {'n', '<leader>F'}
--     }
-- })
