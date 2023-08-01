return {
    { "kyazdani42/nvim-web-devicons", lazy = false },
    -- 'lewis6991/impatient.nvim',
    -- { "nvim-tree/nvim-tree.lua" },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },


    -- Writing / Zenmode
    { 'junegunn/goyo.vim',            cmd = "Goyo" },
    { 'junegunn/limelight.vim',       cmd = "Limelight" },

    -- TJ created lodash of neovim
    "nvim-lua/plenary.nvim",
    { "nvim-lua/popup.nvim",           lazy = false },
    -- {"nvim-telescope/telescope.nvim"},

    -- html

    { 'norcalli/nvim-colorizer.lua',   ft = { "css", "html" },             event = { "BufNewFile", "BufRead" } },
    { 'turbio/bracey.vim' },
    { 'mattn/emmet-vim' },

    { "simrat39/symbols-outline.nvim", event = { "BufNewFile", "BufRead" } },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
        event = "InsertEnter",
    },
    { "lukas-reineke/indent-blankline.nvim", event = { "BufNewFile", "BufRead" } },
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

    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufNewFile", "BufRead" },
        build = ":TSUpdate",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all"
                ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    -- "romgrk/nvim-treesitter-context",
    -- {
    --     "folke/zen-mode.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("zen-mode").setup {
    --             window = {
    --                 width = 90,
    --                 options = {
    --                     number = true,
    --                     relativenumber = true,
    --                 }
    --             },
    --         }
    --     end
    -- },

}
