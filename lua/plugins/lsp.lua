return {
  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- python type stubs
      "microsoft/python-type-stubs",
      -- python typeshed
      "python/typeshed",
    },
    opts = function(_, opts)
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable signature help
      keys[#keys + 1] = { "<C-k>", false }

      return vim.tbl_deep_extend("force", opts, {
        codelens = { enabled = true },
        server = {
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
      })
    end,
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
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      create_autocmd = false,
    },
    config = function(_, opts)
      require("barbecue").setup(opts)

      vim.api.nvim_create_autocmd({ "WinScrolled", "BufWinEnter", "CursorHold", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("barbecue,updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  },
}
