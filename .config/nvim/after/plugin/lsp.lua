local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local sumneko_root_path = "/home/niklas/Source/lua-language-server/"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

--Enable (broadcasting) snippet capability for completion
local capabilities_broad = vim.lsp.protocol.make_client_capabilities()
capabilities_broad.textDocument.completion.completionItem.snippetSupport = true

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
    -- youtube = "[Suck it YT]",
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    -- cmp_tabnine = "[TN]",
    path = "[Path]",
}
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            require("luasnip").lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        -- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-d>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
}),

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == "cmp_tabnine" then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. " " .. menu
                end
                vim_item.kind = ""
            end
            vim_item.menu = menu
            return vim_item
        end,
    },

    sources = {
        -- tabnine completion? yayaya

        -- { name = "cmp_tabnine" },

        { name = "nvim_lsp" },

        -- For vsnip user.
        -- { name = 'vsnip' },

        -- For luasnip user.
        { name = "luasnip" },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = "buffer" },

        { name = "youtube" },
    },
})


local function config(_config)
    return vim.tbl_deep_extend("force", {
        on_attach = function()
            local opts = { buffer = true };
            nnoremap("gd", function() vim.lsp.buf.definition() end, opts)
            nnoremap("K", function() vim.lsp.buf.hover() end, opts)
            nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            nnoremap("<leader>vd", function() vim.diagnostic.open_float() end, opts)
            nnoremap("[d", function() vim.diagnostic.goto_next() end, opts)
            nnoremap("]d", function() vim.diagnostic.goto_prev() end, opts)
            nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
                filter = function(code_action)
                    if not code_action or not code_action.data then
                        return false
                    end

                    local data = code_action.data.id
                    return string.sub(data, #data - 1, #data) == ":0"
                end,
                apply = true
            }) end, opts)
            nnoremap("<leader>vrr", function() vim.lsp.buf.references() end, opts)
            nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            inoremap("<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end,
    }, _config or {})
end


require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup(config(
        {capabilities = capabilities}
        ))
    end,
}

require'lspconfig'.bashls.setup(config())
require("lspconfig").html.setup({
    cmd = { "vscode-html-language-server", "--stdio" },
    filetype = { "html" },
    capabilities = capabilities,
    init_options = {
        configurationsSection = { "html","css","javascript"},
        embeddedLanguages = {
            css = true,
            javascript = true,
        }
    },
    settings = {}
},config())

require("lspconfig").grammarly.setup(config())
--
--
-- require("lspconfig").ccls.setup(config())
--
-- require("lspconfig").jedi_language_server.setup(config())
--
-- require("lspconfig").svelte.setup(config())
--
-- require("lspconfig").solang.setup(config())
--
-- require("lspconfig").cssls.setup(config())
--
-- require('lspconfig').astro.setup(config())

require("lspconfig").sumneko_lua.setup(config({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
}))

local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

require("symbols-outline").setup(opts)

-- local snippets_paths = function()
--     local plugins = { "friendly-snippets" }
--     local paths = {}
--     local path
--     local root_path = vim.env.HOME .. "/.vim/plugged/"
--     for _, plug in ipairs(plugins) do
--         path = root_path .. plug
--         if vim.fn.isdirectory(path) ~= 0 then
--             table.insert(paths, path)
--         end
--     end
--     -- table.insert(paths, "~/.config/nvim/my_snippets/")
--     return paths
-- end

require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
    -- paths = snippets_paths(),
    -- include = nil, -- Load all languages
    -- exclude = {},
})
