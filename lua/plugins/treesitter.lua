return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      local TS = require("nvim-treesitter")
      TS.setup(opts)

      -- mdx register
      vim.filetype.add({
        extension = { mdx = "mdx" },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
