
vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    version = "v1"
  }
})

require("blink.cmp").setup()

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

local function setup_blink_highlights()
  local hl = vim.api.nvim_set_hl

  -- ==========================================
  -- Window & UI Elements
  -- ==========================================
  -- Use inactiveBg to make the popup slightly stand out from the main bg
  hl(0, 'BlinkCmpMenu', { fg = vague.fg, bg = vague.inactiveBg })
  hl(0, 'BlinkCmpMenuBorder', { fg = vague.line, bg = vague.inactiveBg })
  hl(0, 'BlinkCmpMenuSelection', { bg = vague.line, bold = true })

  -- Documentation & Signature Help windows
  hl(0, 'BlinkCmpDoc', { fg = vague.fg, bg = vague.bg })
  hl(0, 'BlinkCmpDocBorder', { fg = vague.line, bg = vague.bg })
  hl(0, 'BlinkCmpDocSeparator', { fg = vague.line })

  hl(0, 'BlinkCmpSignatureHelp', { fg = vague.fg, bg = vague.bg })
  hl(0, 'BlinkCmpSignatureHelpBorder', { fg = vague.line, bg = vague.bg })

  -- ==========================================
  -- Labels & Ghost Text
  -- ==========================================
  hl(0, 'BlinkCmpLabel', { fg = vague.fg })
  hl(0, 'BlinkCmpLabelDeprecated', { fg = vague.comment, strikethrough = true })
  -- Highlights the characters you've typed (using 'normal' blue)
  hl(0, 'BlinkCmpLabelMatch', { fg = vague.normal, bold = true })

  -- Ghost text for inline completions
  hl(0, 'BlinkCmpGhostText', { fg = vague.comment })

  -- ==========================================
  -- Kinds (Icons and Type text)
  -- ==========================================
  hl(0, 'BlinkCmpKindText', { fg = vague.fg })

  -- Keywords & Variables
  hl(0, 'BlinkCmpKindKeyword', { fg = vague.normal })       -- blue (per your comment)
  hl(0, 'BlinkCmpKindVariable', { fg = vague.fg })
  hl(0, 'BlinkCmpKindReference', { fg = vague.replace })    -- red
  hl(0, 'BlinkCmpKindValue', { fg = vague.insert })         -- green

  -- Functions & Methods
  hl(0, 'BlinkCmpKindMethod', { fg = vague.visual })        -- purple
  hl(0, 'BlinkCmpKindFunction', { fg = vague.visual })      -- purple
  hl(0, 'BlinkCmpKindConstructor', { fg = vague.visual })   -- purple

  -- Objects, Classes, Structs
  hl(0, 'BlinkCmpKindClass', { fg = vague.command })        -- yellow
  hl(0, 'BlinkCmpKindInterface', { fg = vague.command })    -- yellow
  hl(0, 'BlinkCmpKindStruct', { fg = vague.command })       -- yellow
  hl(0, 'BlinkCmpKindModule', { fg = vague.normal })        -- blue

  -- Properties & Fields
  hl(0, 'BlinkCmpKindProperty', { fg = vague.normal })      -- blue
  hl(0, 'BlinkCmpKindField', { fg = vague.normal })         -- blue
  hl(0, 'BlinkCmpKindEnum', { fg = vague.command })         -- yellow
  hl(0, 'BlinkCmpKindEnumMember', { fg = vague.normal })    -- blue

  -- Misc
  hl(0, 'BlinkCmpKindSnippet', { fg = vague.insert })       -- green
  hl(0, 'BlinkCmpKindColor', { fg = vague.visual })         -- purple
  hl(0, 'BlinkCmpKindFile', { fg = vague.fg })
  hl(0, 'BlinkCmpKindFolder', { fg = vague.command })       -- yellow
  hl(0, 'BlinkCmpKindEvent', { fg = vague.command })        -- yellow
  hl(0, 'BlinkCmpKindOperator', { fg = vague.fg })
  hl(0, 'BlinkCmpKindTypeParameter', { fg = vague.command })-- yellow
  hl(0, 'BlinkCmpKindConstant', { fg = vague.command })     -- yellow
  hl(0, 'BlinkCmpKindUnit', { fg = vague.insert })          -- green
end

-- Call the function to apply the highlights
setup_blink_highlights()
