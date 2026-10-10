vim.pack.add({
	"https://github.com/folke/noice.nvim",
})

require("noice").setup({
	lsp = {
		-- override markdown rendering so that other plugins use Treesitter
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			-- removed cmp.entry.get_documentation: you use blink, not nvim-cmp
		},
		signature = {
			enabled = true,
			view = "signature_help", -- use the custom view below
		},
	},
	views = {
		signature_help = {
			view = "hover", -- inherit everything from the hover view
			size = { max_width = 80, max_height = 10 },
			position = { row = 2, col = 0 }, -- one row below the cursor line
			scrollbar = false,
			-- anchor = "NW", -- uncomment to stop it flipping above the cursor near the bottom of the window
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
})
