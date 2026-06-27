vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/smjonas/inc-rename.nvim", -- nice ui for 'grn'
})

require("mason").setup()
require("mason-lspconfig").setup()

local servers = {
	"lua_ls",
	"stylua",
	"ruff",
	"ty",
	"vtsls",
	"biome",
	"html",
	"tailwindcss",
	"cssls",
	"marksman",
	"yamlls",
	"taplo",
	"gopls",
	"terraformls",
	"ansiblels",
}

require("mason-tool-installer").setup({ ensure_installed = servers })

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
})
vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

require("inc_rename").setup({
	post_hook = function() -- save all affected buffers after a replace
		vim.cmd("wa")
	end,
})
vim.keymap.set("n", "grn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Incremental rename" })
