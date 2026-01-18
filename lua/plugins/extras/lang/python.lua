return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  opts = { formatters_by_ft = { python = { "ruff_fix", "ruff_organize_imports", "ruff_format" } } },
}
