return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {
      },
    })
  end,
}
