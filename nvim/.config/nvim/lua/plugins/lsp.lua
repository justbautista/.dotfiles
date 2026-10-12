vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig", -- server configs (lsp/*.lua) for vim.lsp.enable
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/smjonas/inc-rename.nvim", -- nice ui for 'grn'
})

require("mason").setup()

-- lspconfig server name -> mason package name
local servers = {
	lua_ls = "lua-language-server",
	stylua = "stylua",
	ruff = "ruff",
	pyrefly = "pyrefly",
	vtsls = "vtsls",
	biome = "biome",
	html = "html-lsp",
	tailwindcss = "tailwindcss-language-server",
	cssls = "css-lsp",
	marksman = "marksman",
	jsonls = "json-lsp",
	yamlls = "yaml-language-server",
	taplo = "taplo",
	gopls = "gopls",
}

-- install missing servers
local registry = require("mason-registry")
registry.refresh(function()
	for _, pkg_name in pairs(servers) do
		local pkg = registry.get_package(pkg_name)
		if not pkg:is_installed() then
			pkg:install()
		end
	end
end)

vim.lsp.enable(vim.tbl_keys(servers))

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
