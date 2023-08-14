local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff-lsp",
        "pyright",
        "gopls"
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "go",
        "python"
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
     defaults = {
        file_ignore_patterns = {
         "venv"
        }
      },
    },
   },
}

return plugins

