vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4 -- how wide is a tab in spaces
vim.o.shiftwidth = 4 -- how much to move selection in spaces when >/< or >>/<<
vim.o.expandtab = true -- make tabs into spaces

vim.o.mouse = 'a' -- enable mouse
vim.o.mousescroll = 'ver:1,hor:1' -- smoother scroll

vim.o.clipboard = 'unnamedplus' -- sync os and nvim clipboard

vim.o.wrap = false -- disable softwrap by default
vim.o.linebreak = true -- break on words when wrap is enabled
vim.o.cursorline = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.ignorecase = true -- case-insensitive search
vim.o.smartcase = true -- case-sensitive search if upper-case is used

vim.o.signcolumn = "yes" -- reserve space in gutter for gitsigns/diagnostics
vim.o.termguicolors = true -- enable more colors

vim.o.swapfile = true -- recovery for crashes, swapfiles are in ~/.local/state/nvim/swap/ by default
vim.o.undofile = false -- no persistent undos

vim.o.confirm = true -- confirm to close buffer with unsaved changes

vim.o.inccommand = 'split' -- show live substitution in split window, (:%s/foo/bar/g)

vim.o.updatetime = 250 -- update time for plugins and some other stuff (decreased to be faster)

vim.opt.fillchars = { eob = " " } -- remove ~ from fill lines

vim.o.showmode = false -- mode already shows in statusline

