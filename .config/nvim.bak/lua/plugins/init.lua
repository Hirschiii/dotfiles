return {
    "kyazdani42/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    "lewis6991/impatient.nvim", -- improve startup time


    -- Writing / Zenmode
    'junegunn/goyo.vim',
    'junegunn/limelight.vim',

    -- TJ created lodash of neovim
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope.nvim",

    'vigoux/LanguageTool.nvim',

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },


    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",

    -- html

    'turbio/bracey.vim',
    'mattn/emmet-vim',

    "simrat39/symbols-outline.nvim",
    "L3MON4D3/LuaSnip",
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets" -- a bunch of snippets to use
        },
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    "saadparwaiz1/cmp_luasnip",
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    -- The Primeagen

    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    { "iamcco/markdown-preview.nvim", build = "cd app && npm install",
    },
    'junegunn/vim-easy-align',
    'ixru/nvim-markdown',
    {
        'lervag/vimtex',
        config = function()
            vim.g.tex_flavor = 'latex'
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_quickfix_mode = 0
            vim.opt.conceallevel = 1
            vim.g.tex_conceal = 'abdmg'
        end
    },
    -- Color Theme:

    "folke/tokyonight.nvim",
    { "catppuccin/nvim",       as = "catppuccin" },
    {
        'rose-pine/neovim',
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },
    "romgrk/nvim-treesitter-context",
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

}