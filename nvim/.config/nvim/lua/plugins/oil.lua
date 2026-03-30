vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/benomahony/oil-git.nvim", -- extension for oil
})

require("oil").setup({
	preview_win = {
		preview_method = "fast_scratch",
	},
	view_options = {
		show_hidden = true,
	},
	delete_to_trash = true,
	confirmation = {
		border = "solid",
	},
	progress = {
		border = "solid",
	},
	lsp_file_methods = {
		autosave_changes = true,
	},
	watch_for_changes = true,
})

-- open oil from normal buffer
vim.keymap.set("n", "-", "<cmd>Oil --preview<cr>", { desc = "Open oil in preview mode" })

-- open oil with preview on initial load
vim.api.nvim_create_autocmd("User", {
	pattern = "OilEnter",
	callback = vim.schedule_wrap(function(args)
		local oil = require("oil")
		if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
			oil.open_preview()
		end
	end),
})
