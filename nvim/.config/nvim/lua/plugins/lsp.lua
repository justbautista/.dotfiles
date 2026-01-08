local add = require("mini.deps").add

add({
	source = "WhoIsSethDaniel/mason-tool-installer.nvim",
	depends = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
})

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"basedpyright",
		"ruff",
		"ts_ls",
		"eslint",
		"html",
		"tailwindcss",
		"cssls",
		"jsonls",
		"marksman",
		"yamlls",
		"taplo",
		"gopls",
	},
})

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
})
