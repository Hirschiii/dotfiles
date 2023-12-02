return {
	-- Autocompletion
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		lazy = true,
		config = function()
			-- This is where you modify the settings for lsp-zero
			-- Note: autocompletion settings will not take effect

			require('lsp-zero.settings').preset({})
		end
	},
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			-- LSP Support
			-- { 'neovim/nvim-lspconfig' },
			-- { 'williamboman/mason.nvim' },
			-- { 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			-- { 'hrsh7th/cmp-buffer' },
			-- { 'hrsh7th/cmp-path' },
			-- { 'saadparwaiz1/cmp_luasnip' },
			-- { 'hrsh7th/cmp-nvim-lsp' },
			-- { 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{
				"L3MON4D3/LuaSnip",
			},
			"saadparwaiz1/cmp_luasnip",
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
		},
		config = function()
			require 'cmp'.setup {
				sources = {
					{ name = 'path' },
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'buffer' },
				}
			}
		end
	},
	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = 'LspInfo',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
		},
		config = function()
			local lsp = require("lsp-zero")
			lsp.preset("recommended")

			lsp.ensure_installed({
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
				snippet = {
					expand = function(args)
						require 'luasnip'.lsp_expand(args.body)
					end
				},
				preselect = "none",
				completion = {
					completeopt = 'menu,menuone,noinsert,noselect'
				},
				mapping = cmp_mappings
			})
			lsp.set_preferences({
				suggest_lsp_servers = false,
				sign_icons = {
					error = 'E',
					warn = 'W',
					hint = 'H',
					info = 'I'
				}
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

			require('lspconfig').clangd.setup({})

			-- lsp.configure('ltex', {
			--     settings = {
			--         completions = {
			--             ltex = {
			--                 language="de",
			--                 disabledRules = {
			--                     ["en"]    = { "MORFOLOGIK_RULE_EN" },
			--                     ["en-AU"] = { "MORFOLOGIK_RULE_EN_AU" },
			--                     ["en-CA"] = { "MORFOLOGIK_RULE_EN_CA" },
			--                     ["en-GB"] = { "MORFOLOGIK_RULE_EN_GB" },
			--                     ["en-NZ"] = { "MORFOLOGIK_RULE_EN_NZ" },
			--                     ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
			--                     ["en-ZA"] = { "MORFOLOGIK_RULE_EN_ZA" },
			--                     ["es"]    = { "MORFOLOGIK_RULE_ES" },
			--                     ["it"]    = { "MORFOLOGIK_RULE_IT_IT" },
			--                     ["de"]    = { "MORFOLOGIK_RULE_DE_DE" },
			--                 },
			--             },
			--         }
			--     }
			-- })
			--

			-- require("lspconfig").clangd.setup(config({
			--     cmd = { '/usr/bin/clangd', '/main.cpp' }}))
			--
			-- require("luasnip.loaders.from_vscode").load()

			-- Fix Undefined global 'vim'
			lsp.configure('lua_ls', {
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' }
						}
					}
				}
			})
			--
			require 'lspconfig'.jdtls.setup {
				single_file_support = true,
				flags = {
					debounce_text_changes = 150,
				},
				on_attach = function(client, bufnr)
					print('lsp server (jdtls) attached')
				end
			}
			require("mason").setup()
			require("mason-null-ls").setup({
				ensure_installed = {
					-- Opt to list sources here, when available in mason.
				},
				automatic_installation = false,
				handlers = {},
			})
			require("null-ls").setup({
				sources = {
					-- Anything not supported by mason.
				}
			})

			lsp.setup()

			vim.diagnostic.config({
				virtual_text = true
			})
		end
	}
}
