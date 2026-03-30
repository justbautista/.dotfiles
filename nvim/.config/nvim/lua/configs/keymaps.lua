-- center cursor
vim.keymap.set({ "n", "v" }, "j", "jzz", { desc = "Scroll downwards" })
vim.keymap.set({ "n", "v" }, "k", "kzz", { desc = "Scroll upwards" })
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Scroll downwards" })
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "Scroll upwards" })
vim.keymap.set({ "n", "v" }, "n", "nzzzv", { desc = "Next result" })
vim.keymap.set({ "n", "v" }, "N", "Nzzzv", { desc = "Previous result" })

-- easily move line selections up and down, keeping center
vim.keymap.set("v", "J", ":m '>+1<enter>gv=gvzz", { desc = "Move selection down", silent = true })
vim.keymap.set("v", "K", ":m '<-2<enter>gv=gvzz", { desc = "Move selection up", silent = true })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the left window", noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the bottom window", noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the top window", noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the right window", noremap = true, silent = true })

-- window sizing
vim.keymap.set(
	"n",
	"<C-Up>",
	"<cmd>resize +2<cr>",
	{ desc = "Increase window size vertically", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<C-Down>",
	"<cmd>resize -2<cr>",
	{ desc = "Decrease window size vertically", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<C-Left>",
	"<cmd>vertical resize -2<cr>",
	{ desc = "Increase window size horizontally", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<C-Right>",
	"<cmd>vertical resize +2<cr>",
	{ desc = "Decrease window size horizontally", noremap = true, silent = true }
)

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
