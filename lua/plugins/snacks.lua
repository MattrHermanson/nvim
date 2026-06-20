
vim.pack.add({
  "https://github.com/folke/snacks.nvim"
})

require("snacks").setup({
  options = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false }, -- we set this in options.lua
    words = { enabled = true },
  }
})
