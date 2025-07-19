return {
  -- migrate to `ruff`
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    opts = { formatters_by_ft = { python = { "ruff_organize_imports", "ruff_lsp" } } },
  },
}
