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

local servers = {
	lua_ls = {},
	stylua = {},
	ruff = {},
	ty = {},
	vtsls = {},
	biome = {},
	html = {},
	tailwindcss = {},
	cssls = {},
	marksman = {},
	yamlls = {},
	taplo = {},
	gopls = {},
}

require("mason-tool-installer").setup({
	ensure_installed = vim.tbl_keys(servers),
})

local capabilities = require("blink.cmp").get_lsp_capabilities()
for name, server in pairs(servers) do
	server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
	vim.lsp.config(name, server)
	vim.lsp.enable(name)
end

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
})
