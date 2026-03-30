vim.pack.add({ "https://github.com/MagicDuck/grug-far.nvim" })

require("grug-far").setup()

-- pre-fill with word under cursor
vim.keymap.set("n", "<leader>sr", function()
	require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
end, { desc = "Search word under cursor" })

-- pre-fill with visual selection (run from visual mode)
vim.keymap.set("v", "<leader>sr", function()
	require("grug-far").with_visual_selection()
end, { desc = "Search and replace selection" })
