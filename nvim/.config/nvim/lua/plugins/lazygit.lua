local add = require("mini.deps").add

add({ source = "kdheepak/lazygit.nvim", depends = { "nvim-lua/plenary.nvim" } })

vim.keymap.set("n", "<leader>g", "<cmd>LazyGit<cr>", { desc = "Open lazygit" })
