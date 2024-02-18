return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			'rafamadriz/friendly-snippets'
		},
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local ls = require("luasnip")
			local cmp = require 'cmp'
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").load({ paths = "./snippets" })
			local handlers = {
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities
					}
				end,
				-- Next, you can provide targeted overrides for specific servers.
				["rust_analyzer"] = function()
					require("rust-tools").setup {}
				end,
				["jdtls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.jdtls.setup {
						root_dir = function(fname)
							return vim.fn.getcwd()
						end,
						flags = {
							debounce_text_changes = 80,
						},
						-- Here you can configure eclipse.jdt.ls specific settings
						-- These are defined by the eclipse.jdt.ls project and will be passed to eclipse when starting.
						-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
						-- for a list of options
						settings = {
							java = {
								format = {
									settings = {
										-- Use Google Java style guidelines for formatting
										-- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
										-- and place it in the ~/.local/share/eclipse directory
										-- url = "/.local/share/nvim/java-google-style.xml",
										profile = "GoogleStyle",
									},
								},
								signatureHelp = { enabled = true },
								contentProvider = { preferred = 'fernflower' }, -- Use fernflower to decompile library code
								-- Specify any completion options
								completion = {
									favoriteStaticMembers = {
										"org.hamcrest.MatcherAssert.assertThat",
										"org.hamcrest.Matchers.*",
										"org.hamcrest.CoreMatchers.*",
										"org.junit.jupiter.api.Assertions.*",
										"java.util.Objects.requireNonNull",
										"java.util.Objects.requireNonNullElse",
										"org.mockito.Mockito.*"
									},
									filteredTypes = {
										"com.sun.*",
										"io.micrometer.shaded.*",
										"java.awt.*",
										"jdk.*", "sun.*",
									},
								},
								-- Specify any options for organizing imports
								sources = {
									organizeImports = {
										starThreshold = 9999,
										staticStarThreshold = 9999,
									},
								},
								-- How code generation should act
								codeGeneration = {
									toString = {
										template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
									},
									hashCodeEquals = {
										useJava7Objects = true,
									},
									useBlocks = true,
								},
								-- If you are developing in projects with different Java versions, you need
								-- to tell eclipse.jdt.ls to use the location of the JDK for your Java version
								-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
								-- And search for `interface RuntimeOption`
								-- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
								-- configuration = {
								-- 	runtimes = {
								-- 		{
								-- 			name = "JavaSE-17",
								-- 			path = home .. "/.asdf/installs/java/corretto-17.0.4.9.1",
								-- 		},
								-- 		{
								-- 			name = "JavaSE-11",
								-- 			path = home .. "/.asdf/installs/java/corretto-11.0.16.9.1",
								-- 		},
								-- 		{
								-- 			name = "JavaSE-1.8",
								-- 			path = home .. "/.asdf/installs/java/corretto-8.352.08.1"
								-- 		},
								-- 	}
								-- }
							}
						},
					}
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" }
								}
							}
						}
					}
				end,
			}
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls"
				},
				handlers = handlers,
			})

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				preselect = "none",
				completion = {
					completeopt = "menu,menuone,noinsert,noselect",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<Return>"] = cmp.mapping.confirm(),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					-- { name = 'vsnip' }, -- For vsnip users.
					{ name = 'luasnip' }, -- For luasnip users.
					{ name = 'path' }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = 'buffer' },
					{ name = 'cmdline' },
				})
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				}, {
					{ name = 'buffer' },
				})
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				})
			})
		end

	},
	{
		"barreiroleo/ltex_extra.nvim",
		ft = { "markdown", "tex", "bib", "latex" },
		dependencies = { "neovim/nvim-lspconfig" },
		-- yes, you can use the opts field, just I'm showing the setup explicitly
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require("ltex_extra").setup {
				server_opts = {
					capabilities = capabilities,
					-- on_attach = function(client, bufnr)
					-- 	-- your on_attach process
					-- end,
					settings = {
						ltex = {
							enabled = { "latex", "tex", "bib", "markdown", },
							language = "auto",
							diagnosticSeverity = "information",
							sentenceCacheSize = 2000,
							additionalRules = {
								enablePickyRules = true,
								motherTongue = "de",
							},
							disabledRules = {
								fr = { "APOS_TYP", "FRENCH_WHITESPACE" },
								de = {}
							},
							dictionary = (function()
								-- For dictionary, search for files in the runtime to have
								-- and include them as externals the format for them is
								-- dict/{LANG}.txt
								--
								-- Also add dict/default.txt to all of them
								local files = {}
								for _, file in ipairs(vim.api.nvim_get_runtime_file("dict/*", true)) do
									local lang = vim.fn.fnamemodify(file, ":t:r")
									local fullpath = vim.fs.normalize(file, ":p")
									files[lang] = { ":" .. fullpath }
								end

								if files.default then
									for lang, _ in pairs(files) do
										if lang ~= "default" then
											vim.list_extend(files[lang], files.default)
										end
									end
									files.default = nil
								end
								return files
							end)(),
						},

					}
				},
			}
		end
	}
}
