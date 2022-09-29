local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local sumneko_root_path = "/home/niklas/Source/lua-language-server/"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	youtube = "[Suck it YT]",
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
--
-- local lspkind = require("lspkind")

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

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
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
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

	-- formatting = {
	-- 	format = function(entry, vim_item)
	-- 		vim_item.kind = lspkind.presets.default[vim_item.kind]
	-- 		local menu = source_mapping[entry.source.name]
	-- 		if entry.source.name == "cmp_tabnine" then
	-- 			if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
	-- 				menu = entry.completion_item.data.detail .. " " .. menu
	-- 			end
	-- 			vim_item.kind = ""
	-- 		end
	-- 		vim_item.menu = menu
	-- 		return vim_item
	-- 	end,
	-- },
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		-- tabnine completion? yayaya

		-- { name = "cmp_tabnine" },

    { name = 'path' },

		{ name = "nvim_lsp" },

		-- For vsnip user.
		{ name = "vsnip" },

		-- For luasnip user.
		{ name = "luasnip" },

		-- For ultisnips useris:issue is:open .
		{ name = "ultisnips" },

		{ name = "buffer" },

		{ name = "youtube" },
	},
})


-- local tabnine = require("cmp_tabnine.config")
-- tabnine:setup({
-- 	max_lines = 1000,
-- 	max_num_results = 20,
-- 	sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = "..",
-- })

-- local function config(_config)
-- 	return vim.tbl_deep_extend("force", {
-- 		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
-- 		on_attach = function()
-- 			nnoremap("gd", function()
-- 				vim.lsp.buf.definition()
-- 			end)
-- 			nnoremap("K", function()
-- 				vim.lsp.buf.hover()
-- 			end)
-- 			nnoremap("<leader>vws", function()
-- 				vim.lsp.buf.workspace_symbol()
-- 			end)
-- 			nnoremap("<leader>vd", function()
-- 				vim.diagnostic.open_float()
-- 			end)
-- 			nnoremap("[d", function()
-- 				vim.diagnostic.goto_next()
-- 			end)
-- 			nnoremap("]d", function()
-- 				vim.diagnostic.goto_prev()
-- 			end)
-- 			nnoremap("<leader>vca", function()
-- 				vim.lsp.buf.code_action()
-- 			end)
-- 			nnoremap("<leader>vrr", function()
-- 				vim.lsp.buf.references()
-- 			end)
-- 			nnoremap("<leader>vrn", function()
-- 				vim.lsp.buf.rename()
-- 			end)
-- 			inoremap("<C-h>", function()
-- 				vim.lsp.buf.signature_help()
-- 			end)
-- 		end,
-- 	}, _config or {})
-- end

require("luasnip.loaders.from_vscode").lazy_load()

require'lspconfig'.bashls.setup{}

require'lspconfig'.html.setup{
    capabilities = capabilities,
}
-- require("lspconfig").zls.setup(config())
--
-- require("lspconfig").bashls.setup(config())
--
-- require("lspconfig").tsserver.setup(config())
--
-- require("lspconfig").ccls.setup(config())
--
-- require("lspconfig").jedi_language_server.setup(config())
--
-- require("lspconfig").svelte.setup(config())
--
-- require("lspconfig").solang.setup(config())
--
require("lspconfig").cssls.setup{capabilities = capabilities}
--
-- require("lspconfig").gopls.setup(config({
-- 	cmd = { "gopls", "serve" },
-- 	settings = {
-- 		gopls = {
-- 			analyses = {
-- 				unusedparams = true,
-- 			},
-- 			staticcheck = true,
-- 		},
-- 	},
-- }))

-- who even uses this?
-- require("lspconfig").rust_analyzer.setup(config({
-- 	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
-- 	--[[
--     settings = {
--         rust = {
--             unstable_features = true,
--             build_on_save = false,
--             all_features = true,
--         },
--     }
--     --]]
-- }))
--
require("lspconfig").sumneko_lua.setup {
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
}

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

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. "/.vim/plugged/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

