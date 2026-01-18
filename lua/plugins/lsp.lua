return {
  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "microsoft/python-type-stubs", -- python type stubs
      "python/typeshed", -- python typeshed
    },
    opts = {
      codelens = { enabled = true },
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              openFilesOnly = true,
              analysis = {
                logLevel = "Trace",
                stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
                extraPaths = {},
                typeshedPaths = { vim.fn.stdpath("data") .. "/lazy/typeshed" },
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                autoImportCompletions = true,
              },
            },
          },
        },
      },
    },
    keys = {
      { "<C-k>", false },
    },
  },

  -- lsp installer
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        ui = { border = "rounded" },
      })
    end,
  },

  -- vscode-like winbar
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = { "SmiteshP/nvim-navic" },
    opts = { create_autocmd = false },
    config = function(_, opts)
      require("barbecue").setup(opts)

      vim.api.nvim_create_autocmd({ "WinScrolled", "BufWinEnter", "CursorHold", "InsertLeave", "BufModifiedSet" }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  },
}
