vim.pack.add({
	"https://github.com/shellraining/hlchunk.nvim",
})

require("hlchunk").setup({
	chunk = {
		enable = true,
		style = {
			{ fg = "#9DA9A0" },
			{ fg = "#E67E80" },
		},
		textobject = "ic",
		duration = 0,
		delay = 0,
	},
	line_num = {
		enable = true,
		use_treesitter = true,
		style = {
			bold = true,
		},
	},
})
