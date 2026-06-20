
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter"
})

require("nvim-treesitter").setup()

require("nvim-treesitter").install({
  "c",
  "zig",
  "lua",
  "vim",
  "java",
  "python",
  "javascript",
  "json",
  "luadoc",
  "markdown",
  "tsx",
  "typescript",
  "regex",
  "bash",
  "css",
  "html",
  "latex",
  "norg",
  "scss",
  "svelte",
  "typst",
  "vue"
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TreesitterHighlight', { clear = true }),
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
