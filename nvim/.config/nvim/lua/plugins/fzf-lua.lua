vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/j-hui/fidget.nvim", -- dep
	"https://github.com/nvim-treesitter/nvim-treesitter", -- dep
})

require("fzf-lua").setup({
	winopts = {
		fullscreen = false,
		border = "solid",
		preview = {
			border = "solid",
		},
	},
})

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader><leader>", fzf.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Project-wide grep" })
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Search help" })
vim.keymap.set("n", "<leader>fs", fzf.treesitter, { desc = "Search symbols" })

local function fidget_history()
	local ok, notifications = pcall(function()
		return require("fidget.notification").get_history()
	end)

	if not ok or not notifications then
		vim.notify("No Fidget history found")
		return
	end

	local items = {}

	for _, notif in ipairs(notifications) do
		local msg = notif.message or ""
		local title = notif.title or ""
		local level = notif.level or "INFO"

		table.insert(items, string.format("[%s] %s %s", level, title, msg))
	end

	fzf.fzf_exec(items, {
		prompt = "Notifications❯ ",
		previewer = false,
		actions = {
			["default"] = function(selected)
				print(selected[1])
			end,
		},
	})
end

vim.keymap.set("n", "<leader>fn", fidget_history, { desc = "Fidget notification history" })
