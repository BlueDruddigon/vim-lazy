return {
  -- customize default formatters for markdown
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
        markdown = vim.tbl_filter(function(fmt)
          return fmt ~= "prettier"
        end, opts.formatters_by_ft.markdown or {}),
        ["markdown.mdx"] = vim.tbl_filter(function(fmt)
          return fmt ~= "prettier"
        end, opts.formatters_by_ft["markdown.mdx"] or {}),
      })

      -- `prettierd` is more efficient than `prettier`
      table.insert(opts.formatters_by_ft.markdown, 1, "prettierd")
      table.insert(opts.formatters_by_ft["markdown.mdx"], 1, "prettierd")
    end,
  },
}
