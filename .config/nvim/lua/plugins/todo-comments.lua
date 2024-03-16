return {
  "folke/todo-comments.nvim",
	config = function()
		require("todo-comments").setup({
    dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
  },
  })
  end,
}
