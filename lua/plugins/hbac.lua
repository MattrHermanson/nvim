vim.pack.add({
	"https://github.com/axkirillov/hbac.nvim",
})

local actions = require("hbac.telescope.actions")

require("hbac").setup({
	autoclose = true, -- set autoclose to false if you want to close buffers manually
	autopin = true, -- set autopin to false if you want to pin buffers manually
	autopin_events = { "InsertEnter", "BufModifiedSet" }, -- The vim events on which autopin will trigger, given that it is enabled
	threshold = 10, -- hbac will start closing unedited buffers once that number is reached
	count_pinned = true, -- whether pinned buffers will count towards the autoclose threshold
	close_command = function(bufnr)
		vim.api.nvim_buf_delete(bufnr, {})
	end,
	close_buffers_with_windows = false, -- hbac will close buffers with associated windows if this option is `true`
	telescope = {
		sort_mru = true,
		sort_lastused = true,
		selection_strategy = "row",
		use_default_mappings = true, -- false to not include the mappings below
		mappings = {
			i = {
				["<M-c>"] = actions.close_unpinned,
				["<M-x>"] = actions.delete_buffer,
				["<M-a>"] = actions.pin_all,
				["<M-u>"] = actions.unpin_all,
				["<M-y>"] = actions.toggle_pin,
			},
			n = {
				-- as above
			},
		},
		-- Pinned/unpinned icons and their hl groups. Defaults to nerdfont icons
		pin_icons = {
			pinned = { "󰐃 ", hl = "DiagnosticOk" },
			unpinned = { "󰤱 ", hl = "DiagnosticError" },
		},
	},
})

require("telescope").load_extension("hbac")

vim.keymap.set("n", "<leader>fb", function()
	require("telescope").extensions.hbac.buffers()
end, { desc = "Hbac buffer menu" })
