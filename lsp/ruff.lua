return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "ruff.toml", ".ruff.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
  settings = {
    ruff = {
      init_options = {
        settings = {
          configuration = "~/.config/ruff/ruff.toml",
        },
      },
    },
  },
}

