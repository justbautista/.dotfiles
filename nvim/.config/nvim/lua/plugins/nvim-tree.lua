vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" })

-- disable netrw, nvim-tree replaces it
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- only these mappings exist in the tree, nvim-tree's defaults are not loaded
local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function map(mode, key, fn, desc)
		vim.keymap.set(mode, key, fn, { buffer = bufnr, desc = "nvim-tree: " .. desc, nowait = true, silent = true })
	end

	local function is_dir(node)
		return node and node.type == "directory"
	end

	-- open
	map("n", "<CR>", function()
		local node = api.tree.get_node_under_cursor()
		if node and not is_dir(node) and node.name ~= ".." then
			api.node.open.edit(node)
		end
	end, "Open file")
	map("n", "l", function()
		local node = api.tree.get_node_under_cursor()
		if is_dir(node) then
			if not node.open then
				api.node.open.edit(node)
			end
		elseif node and node.name ~= ".." then
			api.node.open.preview(node)
		end
	end, "Open folder / preview file")
	map("n", "h", function()
		local node = api.tree.get_node_under_cursor()
		if is_dir(node) and node.open then
			api.node.open.edit(node)
		else
			api.node.navigate.parent_close(node)
		end
	end, "Close folder")

	-- navigate
	map("n", "-", api.node.navigate.parent, "Jump to parent")
	map("n", "H", api.tree.collapse_all, "Collapse all")
	map("n", "q", api.tree.close, "Close tree")
	map("n", "R", api.tree.reload, "Refresh")
	map("n", "g?", api.tree.toggle_help, "Help")

	-- file operations (x, y, d, gy also work on a visual selection)
	map("n", "a", api.fs.create, "Create file or folder (end with /)")
	map("n", "r", api.fs.rename, "Rename")
	map({ "n", "x" }, "x", api.fs.cut, "Cut")
	map({ "n", "x" }, "y", api.fs.copy.node, "Copy")
	map("n", "p", api.fs.paste, "Paste")
	map({ "n", "x" }, "d", api.fs.trash, "Move to trash")
	map({ "n", "x" }, "gy", api.fs.copy.absolute_path, "Copy absolute path")
end

require("nvim-tree").setup({
	on_attach = on_attach,
	update_focused_file = {
		enable = true, -- highlight the current buffer's file in the tree
	},
	filters = {
		dotfiles = false,
	},
	renderer = {
		root_folder_label = ":t", -- show only the root folder's name
	},
	actions = {
		change_dir = {
			restrict_above_cwd = true, -- never go above the folder nvim was opened in
		},
		open_file = {
			resize_window = false, -- keep manual tree width when opening files
		},
	},
})

-- open the tree with the cursor on the current file
vim.keymap.set("n", "-", function()
	require("nvim-tree.api").tree.find_file({ open = true, focus = true })
end, { desc = "Open file tree" })
