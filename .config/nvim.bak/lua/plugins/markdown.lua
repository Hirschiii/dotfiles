return {
	-- {
	--     "toppair/peek.nvim",
	--     build = "deno task --quiet build:fast",
	--     keys = {
	--         {
	--         "<leader>op",
	--             function()
	--             local peek = require("peek")
	--                 if peek.is_open() then
	--             peek.close()
	--             else
	--             peek.open()
	--             end
	--         end,
	--         desc = "Peek (Markdown Preview)",
	--         },
	-- },
	--     opts = { theme = "dark", app = "browser" },
	-- },
	{
		'https://gitlab.com/itaranto/plantuml.nvim',
		version = '*',
		ft = "plantuml",
		config = function()
			require('plantuml').setup(
				{
					renderer = {
						type = 'image',
						options = {
							prog = 'feh',
							dark_mode = true,
						}
					},
					render_on_write = true,
				})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = "markdown",
	},
	{ 'junegunn/vim-easy-align', cmd = "EasyAlign" },
	{
		'ixru/nvim-markdown',
		ft = "markdown",
		-- lazy = false,
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		},
		config = function()
			vim.g.vim_markdown_frontmatter = 1
			vim.g.vim_markdown_math = 1
		end
	},
	{
		'lervag/vimtex',
		ft = { "markdown" },
		-- lazy = false,
		config = function()
			vim.g.tex_flavor = 'latex'
			vim.g.vimtex_view_method = 'zathura'
			vim.g.vimtex_quickfix_mode = 0
			vim.opt.conceallevel = 1
			vim.g.tex_conceal = 'abdmg'
		end
	},
}
