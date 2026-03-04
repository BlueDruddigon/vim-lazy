return {
  -- LSP servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "microsoft/python-type-stubs", -- python type stubs
      "python/typeshed", -- python typeshed
    },
  },

  -- formatters
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    opts = { formatters_by_ft = { python = { "ruff_fix", "ruff_organize_imports", "ruff_format" } } },
  },
}
