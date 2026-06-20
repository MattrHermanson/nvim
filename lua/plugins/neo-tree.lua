
vim.pack.add({
  "https://github.com/nvim-neo-tree/neo-tree.nvim"
})

require("neo-tree").setup({
  event_handlers = {
    {
      -- close after opening
      event = "file_open_requested",
      handler = function()
        require("neo-tree.command").execute({ action = "close" })
      end
    },
  }
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree reveal toggle<CR>", { desc = "Toggle Explorer (Reveal)" })
