-- highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank({ timeout = 150 })
	end,
})

-- highlight references when the cursor is idle
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method("textDocument/documentHighlight", event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				buffer = event.buf,
				group = highlight_augroup,
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

-- format on save with the first attached LSP in each filetype's list
-- (biome only attaches in projects with a biome config)
local formatters_for = {
	lua = { "stylua" },
	python = { "ruff" },
	go = { "gopls" },
	javascript = { "biome", "vtsls" },
	javascriptreact = { "biome", "vtsls" },
	typescript = { "biome", "vtsls" },
	typescriptreact = { "biome", "vtsls" },
	json = { "biome", "jsonls" },
	jsonc = { "biome", "jsonls" },
	css = { "biome", "cssls" },
	html = { "html" }, -- biome's html formatter is opt-in
	toml = { "taplo" },
	yaml = { "yamlls" },
}

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format on save with the filetype's LSP formatter",
	group = vim.api.nvim_create_augroup("lsp-format", { clear = true }),
	callback = function(args)
		for _, name in ipairs(formatters_for[vim.bo[args.buf].filetype] or {}) do
			if vim.lsp.get_clients({ bufnr = args.buf, name = name })[1] then
				vim.lsp.buf.format({ bufnr = args.buf, name = name, timeout_ms = 500 })
				return
			end
		end
	end,
})

--- ### autocommands mostly for editing and coding with an agent ###

-- auto save when focus lost or buffer leave
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
	pattern = "*",
	callback = function()
		if vim.bo.modified and vim.bo.buftype == "" then
			vim.cmd("silent! wall")
		end
	end,
})

-- sync buffer with disk
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	pattern = "*",
	callback = function()
		vim.cmd("silent! checktime")
	end,
})
