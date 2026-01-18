return {
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        current_line_blame = true,
        current_line_blame_opts = { delay = 100 },
        current_line_blame_formatter = " <author>, <author_time:%d-%m-%Y> - <summary>",
        preview_config = { border = "rounded" },
      })
    end,
  },

  {
    "folke/trouble.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        focus = true,
        auto_close = true,
        keys = {
          ["<CR>"] = "jump_close",
          ["o"] = "jump",
        },
        warn_no_results = false,
        modes = {
          cascade = {
            mode = "diagnostics",
            filter = function(items)
              local severity = vim.diagnostic.severity.HINT
              for _, item in ipairs(items) do
                severity = math.min(severity, item.severity)
              end
              return vim.tbl_filter(function(item)
                return item.severity == severity
              end, items)
            end,
          },
        },
      })
    end,
    keys = {
      { "ge", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "(Trouble) Document Diagnostics" },
      { "gE", "<CMD>Trouble diagnostics toggle<CR>", desc = "(Trouble) Workspace Diagnostics" },
      { "gq", "<CMD>Trouble qflist toggle<CR>", desc = "(Trouble) Quickfix List" },
    },
  },

  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        picker = {
          layouts = {
            sidebar = {
              layout = { width = 25, min_width = 25 },
            },
          },
          sources = {
            explorer = {
              layout = { preset = "sidebar" },
              auto_close = true,
            },
          },
        },
      })
    end,
  },

  {
    "ggandor/flit.nvim",
    opts = { labeled_modes = "n" },
  },

  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    opts = {
      render = "background",
      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_hsl_without_function = true,
      enable_ansi = true,
      enable_var_usage = true,
      enable_tailwind = true,
    },
  },

  { "NvChad/nvim-colorizer.lua", event = "VeryLazy", config = true },
}
