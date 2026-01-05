local add = require('mini.deps').add

add({ source = 'stevearc/oil.nvim' })
add({ source = 'benomahony/oil-git.nvim', depends = { 'stevearc/oil.nvim' } }) -- git hightlighting for files

require('oil').setup({
    view_options = {
        show_hidden = true
    },
    delete_to_trash = true,
    confirmation = {
        border = "single"
    },
    progress = {
        border = "single"
    }
})

-- open oil from normal buffer
vim.keymap.set('n', '-', "<cmd>Oil --preview<cr>", { desc = 'Open oil in preview mode' })

-- open oil with preview on initial load
vim.api.nvim_create_autocmd("User", {
    pattern = "OilEnter",
    callback = vim.schedule_wrap(function(args)
        local oil = require("oil")
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
            oil.open_preview()
        end
    end),
})

