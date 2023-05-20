local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    -- 'sumneko_lua',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<Return>"] = cmp.mapping.confirm(),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup_nvim_cmp({
    preselect = "none",
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.configure('ltex', {
    settings = {
        completions = {
            ltex = {
                disabledRules = {
                    ["en"]    = { "MORFOLOGIK_RULE_EN" },
                    ["en-AU"] = { "MORFOLOGIK_RULE_EN_AU" },
                    ["en-CA"] = { "MORFOLOGIK_RULE_EN_CA" },
                    ["en-GB"] = { "MORFOLOGIK_RULE_EN_GB" },
                    ["en-NZ"] = { "MORFOLOGIK_RULE_EN_NZ" },
                    ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
                    ["en-ZA"] = { "MORFOLOGIK_RULE_EN_ZA" },
                    ["es"]    = { "MORFOLOGIK_RULE_ES" },
                    ["it"]    = { "MORFOLOGIK_RULE_IT_IT" },
                    -- ["de"]    = { "MORFOLOGIK_RULE_DE_DE" },
                },
            },
        }
    }
})

-- require("lspconfig").clangd.setup(config({
--     cmd = { '/usr/bin/clangd', '/main.cpp' }}))
--
require("luasnip.loaders.from_vscode").load()

lsp.setup()
