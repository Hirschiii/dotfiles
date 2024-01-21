return {
	{ "kyazdani42/nvim-web-devicons", lazy = false },
	{
		"numToStr/Comment.nvim",
		event = { "BufNewFile", "BufRead" },
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"mbbill/undotree",
		event = "BufEnter",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end
	},
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end,
		event = "InsertEnter",
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
		event = "InsertEnter",
	},
}
