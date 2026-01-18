return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = { theme = "solarized_dark" },
    },
  },

  -- customizing noice.nvim
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, 1, {
        filter = { event = "notify", find = "No information available" },
        opts = { skip = true },
      })

      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      return vim.tbl_deep_extend("force", opts, {
        presets = { lsp_doc_border = true },
      })
    end,
  },

  -- disable `snacks.nvim` dashboard
  {
    "folke/snacks.nvim",
    opts = { dashboard = { enabled = false } },
  },

  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guibg = colors.base03, guifg = colors.violet500 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        render = function(props)
          local fn = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            fn = "[+]" .. fn
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(fn)
          return { { icon, guifg = color }, { " " }, { fn } }
        end,
      })
    end,
  },
}
