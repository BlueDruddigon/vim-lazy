local supported_filetypes = {
  "python",
  "c",
  "cpp",
  "c#",
  "go",
  "rust",
  "html",
  "css",
  "scss",
  "less",
  "gitcommit",
  "json",
  "jsonc",
  "toml",
  "yaml",
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "markdown",
  "markdown.mdx",
}

return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "cspell" } },
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      for _, ft in ipairs(supported_filetypes) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        table.insert(opts.linters_by_ft[ft], "cspell")
      end
      return opts
    end,
  },
}
