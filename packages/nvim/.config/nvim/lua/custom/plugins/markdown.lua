return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npx --yes yarn install",
    ft = "markdown",
  },
  {
    "lervag/vimtex",
    ft = { "markdown" },
    -- lazy = false,
    config = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_mode = 0
      vim.opt.conceallevel = 0
      vim.g.tex_conceal = "abdmg"
    end,
  },
}
