
vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim"
})

local vague = {
  bg         = '#141415',
  inactiveBg = '#1c1c24',
  fg         = '#cdcdcd',
  line       = '#252530',
  comment    = '#606079',
  normal     = '#6e94b2', -- keyword (blue)
  insert     = '#7fa563', -- plus (green)
  visual     = '#bb9dbd', -- parameter (purple)
  replace    = '#d8647e', -- error (red)
  command    = '#f3be7c', -- warning/delta (yellow)
}

local vague_lualine = {
  normal = {
    a = { bg = vague.normal, fg = vague.bg, gui = 'bold' },
    b = { bg = vague.line, fg = vague.fg },
    c = { bg = 'NONE', fg = vague.fg },
  },
  insert = {
    a = { bg = vague.insert, fg = vague.bg, gui = 'bold' },
    b = { bg = vague.line, fg = vague.fg },
    c = { bg = 'NONE', fg = vague.fg },
  },
  visual = {
    a = { bg = vague.visual, fg = vague.bg, gui = 'bold' },
    b = { bg = vague.line, fg = vague.fg },
    c = { bg = 'NONE', fg = vague.fg },
  },
  replace = {
    a = { bg = vague.replace, fg = vague.bg, gui = 'bold' },
    b = { bg = vague.line, fg = vague.fg },
    c = { bg = 'NONE', fg = vague.fg },
  },
  command = {
    a = { bg = vague.command, fg = vague.bg, gui = 'bold' },
    b = { bg = vague.line, fg = vague.fg },
    c = { bg = 'NONE', fg = vague.fg },
  },
  inactive = {
    a = { bg = vague.inactiveBg, fg = vague.comment, gui = 'bold' },
    b = { bg = vague.inactiveBg, fg = vague.comment },
    c = { bg = 'NONE', fg = vague.comment },
  },
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = vague_lualine,
    component_separators = "|",
    section_separators = "",
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16,
      events = {
        "WinEnter",
        "BufEnter",
        "BufWritePost",
        "SessionLoadPost",
        "FileChangedShellPost",
        "VimResized",
        "Filetype",
        "CursorMoved",
        "CursorMovedI",
        "ModeChanged",
      },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})
