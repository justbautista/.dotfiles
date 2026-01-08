require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.statusline").setup()

-- remap autocompletion to more familiar keys
require("mini.completion").setup()
vim.keymap.set("i", "<CR>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-y>"
	end
	return "<CR>"
end, { expr = true })
vim.keymap.set("i", "<C-j>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-n>"
	end
	return "<C-j>"
end, { expr = true })
vim.keymap.set("i", "<C-k>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-p>"
	end
	return "<C-k>"
end, { expr = true })
vim.keymap.set("i", "<esc>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-e>"
	end
	return "<esc>"
end, { expr = true })

require("mini.notify").setup()
vim.keymap.set("n", "<leader>n", MiniNotify.show_history, { desc = "Show notification history" })

-- extends a/i text objects (like iw or a")
-- adds text objects like f so you can select a function with vaf
require("mini.ai").setup()
