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

    -- Simple plugins can be specified as strings
    -- use("TimUntersberger/neogit")

    -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    -- All the things
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
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

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use("ap/vim-css-color")

    use ('ojroques/nvim-hardline')


    -- Primeagen doesn"t create lodash
    -- use("ThePrimeagen/git-worktree.nvim")
    use("ThePrimeagen/harpoon")
    -- use('ThePrimeagen/vim-be-good')

    use("mbbill/undotree")

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
    -- use("vim-pandoc/vim-pandoc")
    use("vim-pandoc/vim-pandoc-syntax")

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

    -- use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

    -- use("mfussenegger/nvim-dap")
    -- use("rcarriga/nvim-dap-ui")
    -- use("theHamsta/nvim-dap-virtual-text")

    -- Lazy loading:
    -- Load on specific commands
    -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    -- Plugins can have post-install/update hooks
end)
