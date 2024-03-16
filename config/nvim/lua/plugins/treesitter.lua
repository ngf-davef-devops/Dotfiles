return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "markdown",
            "json",
            "javascript",
            "typescript",
            "yaml",
            "html",
            "css",
            "markdown",
            "bash",
            "lua",
            "dockerfile",
            "solidity",
            "gitignore",
            "python",
            "vue",
        },
      })
    end
  }
}
