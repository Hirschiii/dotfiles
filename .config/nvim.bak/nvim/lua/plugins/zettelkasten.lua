return {
    {
        "mickael-menu/zk-nvim",
        event = "VeryLazy",
		dependencies = {
			"junegunn/fzf"
		},
        config = function()
            require("zk").setup({
                picker = "fzf",
            })
        end
    }
}
