-- load theme
require('plugins.theme')

-- load icons
require('mini.deps').add({ source = 'nvim-tree/nvim-web-devicons' })
require('nvim-web-devicons').setup()

-- load rest of plugins
local plugins_dir = vim.fn.stdpath('config') .. '/lua/plugins'

for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
    if file:match('%.lua$') and file ~= 'init.lua' and file ~= 'theme.lua' then
        require('plugins.' .. file:gsub('%.lua$', ''))
    end
end
