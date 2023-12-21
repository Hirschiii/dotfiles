return {
	-- lazy.nvim
	{
		"m4xshen/hardtime.nvim",
		event="VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"jinh0/eyeliner.nvim",
		event="VeryLazy",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
				dim = true,
			})
		end,
	},
}
