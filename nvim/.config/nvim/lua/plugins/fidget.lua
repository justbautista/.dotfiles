local add = require("mini.deps").add

add({ source = "j-hui/fidget.nvim" })

require("fidget").setup()

vim.notify = require("fidget.notification").notify
