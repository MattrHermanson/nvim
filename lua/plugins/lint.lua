
vim.pack.add({
  "https://github.com/mfussenegger/nvim-lint"
})

-- 1. Map your filetypes to the linters you have installed on your system
require('lint').linters_by_ft = {
  javascript = {'eslint_d'},
  python = {'flake8'},
  lua = {'luacheck'},
  typescript = {'eslint'},
  tsx = {'eslint'},
  markdown = {'markdownlint'},
  css = {'stylelint'},
  html = {'htmlhint'},
  c = {'clangtidy'},
  zsh = {'shellcheck'},
  java = {'checkstyle'},
  zig = {'zig'},
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
  callback = function()
    require("lint").try_lint()
  end,
})
