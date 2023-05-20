-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Cre

-- augroup('setIndent', { clear = true })
-- autocmd(
--     "Filetype",
--     {
--         group = 'setIndent',
--         pattern = "markdown",
--         command = "set syntax=markdown.pandoc"
--     }
-- )
--
--
autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.md", "vimwiki" }, command = "set syntax=markdown.pandoc" }
)
