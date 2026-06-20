
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
  },
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        { icon = " ", key = "f", desc = "Find Files", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = "󰛢 ", key = "h", desc = "Harpoon", action = ":lua require('harpoon.ui').toggle_quick_menu(require('harpoon'):list())" },
        { icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
    sections = {
      -- The Live Clock
      {
        section = "terminal",
        cmd = "tty-clock -t -c -C 4 -r -s -f '%A, %B, %d %p' || date +'%I:%M:%S %p'",
        height = 7,
        padding = 2,
      },
      { section = "keys", gap = 1, padding = 1 },
    }
  }
})
