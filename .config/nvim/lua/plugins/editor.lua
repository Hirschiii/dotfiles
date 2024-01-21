return {
<<<<<<< HEAD
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
=======
    { "kyazdani42/nvim-web-devicons", lazy = false },
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
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
        event = "InsertEnter",
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end,
        event = "InsertEnter",
    },

    {
        "mbbill/undotree",
        event = "BufEnter",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    -- Color Theme:

    -- {
    --     'rose-pine/neovim',
    -- },

    {
        "numToStr/Comment.nvim",
        event = { "BufNewFile", "BufRead" },
        config = function()
            require("Comment").setup()
        end,
    },
>>>>>>> 229fc584750cd286059945d9dfffb3bad8e1ec9d
}
