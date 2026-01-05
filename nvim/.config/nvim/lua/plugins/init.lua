-- auto-load plugins
local plugins_dir = vim.fn.stdpath('config') .. '/lua/plugins'
require('plugins.theme') -- load theme before other plugins

for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
    if file:match('%.lua$') and file ~= 'init.lua' and file ~= 'theme.lua' then
        require('plugins.' .. file:gsub('%.lua$', ''))
    end
end
