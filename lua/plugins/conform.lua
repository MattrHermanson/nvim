vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		zig = { "zigfmt" },
	},
	-- Automatically format on save
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

-- Keybind to format manually
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	conform.format({
		async = true,
		lsp_format = "fallback",
	})
end, { desc = "Format buffer" })
