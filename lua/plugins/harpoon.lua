vim.pack.add({
	{
		src = "https://github.com/ThePrimeagen/harpoon",
		version = "harpoon2",
	},
})

local harpoon = require("harpoon")

harpoon.setup()

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<leader>fh", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open Harpoon window" })

vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open Harpoon Buffer" })

-- Added the desc tag here so which-key can read it
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Add to Harpoon" })
