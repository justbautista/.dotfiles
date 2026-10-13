-- easily move line selections up and down (centering handled by scrolloff + autocmd)
vim.keymap.set("v", "J", ":m '>+1<enter>gv=gv", { desc = "Move selection down", silent = true })
vim.keymap.set("v", "K", ":m '<-2<enter>gv=gv", { desc = "Move selection up", silent = true })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the left window", silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the bottom window", silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the top window", silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the right window", silent = true })

-- window sizing
vim.keymap.set("n", "<C-Up>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width", silent = true })
vim.keymap.set("n", "<C-Down>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width", silent = true })
vim.keymap.set("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height", silent = true })
vim.keymap.set("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height", silent = true })

vim.keymap.set("n", "<esc>", function()
	vim.cmd("nohlsearch")
	vim.lsp.buf.clear_references()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative ~= "" then
			pcall(vim.api.nvim_win_close, win, false)
		end
	end
end, { desc = "Escape: clear hlsearch, LSP refs, floating wins" })

vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select all" })

vim.keymap.set("n", "<leader>_x", '"_x', { desc = "Delete char without saving in register" })
vim.keymap.set("v", "<leader>_p", '"_dP', { desc = "Paste over selected without saving in register" })

vim.keymap.set("n", "<leader><tab>", "<cmd>e #<cr>", { desc = "Alt-tab", silent = true })
