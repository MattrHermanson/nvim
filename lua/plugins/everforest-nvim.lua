vim.pack.add({
	"https://github.com/neanias/everforest-nvim",
})

local contrast = vim.o.background == "dark" and "hard" or "soft"

require("everforest").setup({
	background = contrast,
	colours_override = function(palette)
		palette.bg_dim = "#2b231b"
		palette.bg0 = "#342e28"
		palette.bg1 = "#3b3831"
		palette.bg2 = "#44413a"
		palette.bg3 = "#4e4b45"
		palette.bg4 = "#56514b"
		palette.bg5 = "#5c5b4d"
		palette.bg_visual = "#593738"
		palette.bg_red = "#563b35"
		palette.bg_green = "#494836"
		palette.bg_blue = "#454b4a"
		palette.bg_yellow = "#524431"
		palette.bg_purple = "#533f3d"
	end,
})

vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = function()
		contrast = vim.o.background == "dark" and "hard" or "soft"
		require("everforest").setup({ background = contrast })
		vim.cmd.colorscheme("everforest")
	end,
})

vim.cmd.colorscheme("everforest")
