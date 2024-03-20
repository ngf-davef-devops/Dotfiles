return {

  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {},
    config = function()
      vim.cmd.colorscheme "kanagawa-wave"
      require("kanagawa").load("wave")
    end,
  }
}
--return {

--  {
--    "folke/tokyonight.nvim",
--    lazy = true,
--    opts = { style = "moon" },
--    config = function()
--      vim.cmd.colorscheme "tokyonight-storm"
--    end,
--  }
--}
