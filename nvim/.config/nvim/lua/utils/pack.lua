local M = {}

M.set_keymaps = function()
	vim.keymap.set("n", "<leader>pc", function()
		M.cleanup()
	end, { desc = "Cleanup inactive plugins" })
	vim.keymap.set("n", "<leader>ps", function()
		M.show()
	end, { desc = "Show plugins" })
	vim.keymap.set("n", "<leader>pu", function()
		M.update({})
	end, { desc = "Update plugins" })
end

--- Cleanup inactive plugins from vim.pack
--- @return nil
M.cleanup = function()
	local inactive_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		if not plugin.active then
			table.insert(inactive_plugins, plugin.spec.name)
		end
	end

	if #inactive_plugins == 0 then
		vim.notify("No inactive plugins found", vim.log.levels.INFO)
		return
	end

	local prompt = string.format(
		"Found %d inactive plugin(s):\n\n%s\n\nDelete plugin(s)?\n",
		#inactive_plugins,
		table.concat(inactive_plugins, "\n")
	)
	local choice = vim.fn.confirm(prompt, "&Yes\n&No", 2)

	vim.cmd("redraw") -- clears prompt screen to avoid 'press ENTER' prompt
	if choice == 1 then
		vim.pack.del(inactive_plugins)
	end
end

--- Get plugins
--- @return table<number, table<string, boolean>> List of pairs, where each pair is plugin name and is active
M.get = function()
	local plugins = {}
	for _, plugin in ipairs(vim.pack.get()) do
		table.insert(plugins, { plugin.spec.name, plugin.active })
	end

	return plugins
end

--- Show plugins
--- @return nil
M.show = function()
	local plugins = M.get()
	vim.print(plugins)
end

--- Add and setup plugins
--- @param plugins string[] List of strings of plugin filenames
--- @param plugins_dir string Path to plugins directory
--- @return nil
M.add = function(plugins, plugins_dir)
	local plugin_events = {}

	for _, plugin in ipairs(plugins) do
		local module = plugins_dir .. "." .. plugin
		local ok, err = pcall(require, module)
		if ok then
			table.insert(plugin_events, {
				msg = "[SUCCESS] Loaded plugin: " .. plugin,
				level = vim.log.levels.DEBUG,
			})
		else
			table.insert(plugin_events, {
				msg = "[FAILED] Error when loading plugin: " .. plugin .. "\n" .. err,
				level = vim.log.levels.ERROR,
			})
		end
	end

	for _, event in ipairs(plugin_events) do
		vim.notify(event.msg, event.level)
	end
end

--- Add and setup plugins
--- @param plugins string[] List of strings of plugins
--- @return nil
M.update = function(plugins)
	if #plugins > 0 then
		vim.pack.update(plugins)
		return
	end

	local plugins_available = M.get()
	local plugins_list = {}
	for _, p in ipairs(plugins_available) do
		table.insert(plugins_list, p[0])
	end
	vim.pack.update(plugins_list)
end

return M
