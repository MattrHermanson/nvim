
vim.pack.add({
  "https://github.com/folke/persistence.nvim"
})

require("persistence").setup({
  dir = vim.fn.stdpath("state") .. "/sessions/",
  need = 1,
  branch = true,
})

-- Restore the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore Session" })

-- Restore the absolute last session you were in (regardless of directory)
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore Last Session" })

-- Stop persistence from saving the current session
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Don't Save Current Session" })
