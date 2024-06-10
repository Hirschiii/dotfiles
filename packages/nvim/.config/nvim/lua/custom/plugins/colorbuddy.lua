return {
  "tjdevries/colorbuddy.nvim",
  lazy = false,
  priority = 100,
  dependencies = {
    { "norcalli/nvim-colorizer.lua" },
  },
  config = function()
    require "custom.colorsheme"
  end,
}
