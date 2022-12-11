local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("sbdchd/neoformat")
    use("kyazdani42/nvim-web-devicons")
	  use("lewis6991/impatient.nvim") -- improve startup time

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

        -- trying copilot for 1 week
    -- use("github/copilot.vim")
    use("github/copilot.vim")
    use("zbirenbaum/copilot.lua");
    use({
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function ()
            require("copilot_cmp").setup()
        end
    });
    -- Simple plugins can be specified as strings
    -- use("TimUntersberger/neogit")

    -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    -- All the things

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use('mattn/emmet-vim')
    use('mfussenegger/nvim-lint')

    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")

    use("simrat39/symbols-outline.nvim")
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
    use("saadparwaiz1/cmp_luasnip")
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- use('https://git.sr.ht/~soywod/himalaya-vim')
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use("preservim/tagbar")
    -- use("ap/vim-css-color")

    -- use ('ojroques/nvim-hardline')


    -- Primeagen doesn"t create lodash
    use("ThePrimeagen/git-worktree.nvim")
    use("ThePrimeagen/harpoon")
    use("ThePrimeagen/refactoring.nvim")
    -- use('ThePrimeagen/vim-be-good')
    -- use('ThePrimeagen/vim-with-me')

    -- use {
    --     'nvim-lualine/lualine.nvim',
    --     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    -- }

    use("mbbill/undotree")
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- My note System
    -- use({'jakewvincent/mkdnflow.nvim',
--     rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
--     config = function()
--         require('mkdnflow').setup({})
--     end
-- })
    -- use("junegunn/goyo.vim")
    use("junegunn/limelight.vim")
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use("vimwiki/vimwiki")
    -- use("lervag/wiki.vim")
    use('junegunn/vim-easy-align')
    -- use("vim-pandoc/vim-pandoc")
    use("vim-pandoc/vim-pandoc-syntax")

    -- use {'glepnir/template.nvim'}

    -- Colorscheme section
    -- use({
    --     "catppuccin/nvim",
    --     as = "catppuccin",
    -- })
    use("folke/tokyonight.nvim")
    -- use("lunarvim/colorschemes") -- A bunch of colorschemes you can try output

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate",
    })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    -- use("tools-life/taskwiki")

    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- Lazy loading:
    -- Load on specific commands
    -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    -- Plugins can have post-install/update hooks
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
