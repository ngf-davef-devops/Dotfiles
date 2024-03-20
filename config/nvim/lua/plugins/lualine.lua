return {
	"nvim-lualine/lualine.nvim",
  dependencies = { 'rebelot/kanagawa.nvim' },
  config = function()
		require("lualine").setup({
			options = {
				theme = "kanagawa",
			},
		})
	end,
}
