-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	-- vis:command('set number')
	vis:command('set autoindent on')
	vis:command('set number')
	--vis:command('set show-newlines on')
	vis:command('set show-tabs on')
	vis:command('set tabwidth 4')
	vis:command('set theme custom')

	lines = #(win.file.lines)

	--[[ TODO
	local custom_status = function(win)
		local line = win.selection.line
		local col = win.selection.col
		local modified
		if win.file.modified then
			modified = " [+]"
		else
			modified = ""
		end
		win:status(vis.mode .. "|" .. win.file.path .. modified, col .. ":" .. line .. "/" .. lines)
	end
	vis.events.subscribe(vis.events.INPUT, custom_status)
	]]
end)
