-- load standard vis module, providing parts of the Lua API
require('vis')

local tk = require('tk')

vis.events.subscribe(vis.events.INIT, function()
	vis:command('set theme custom')
end)

vis.events.subscribe(vis.events.FILE_OPEN, function(file)
	local name = file.name
	
	-- defaults
	vis:command('set expandtab off')
	vis:command('set tabwidth 4')

	-- change settings depending on filetype
	if name ~= nil then
		for pattern, funcs in pairs(tk.filetypes) do
			if string.find(name, pattern) ~= nil then
				funcs.indent()
				vis:command_register("run", funcs.run)
				vis:command_register("test", funcs.test)
			end
		end
	end

end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command('set autoindent on')
	vis:command('set number')
	vis:command('set show-tabs on')
end)

vis.events.subscribe(vis.events.WIN_STATUS, tk.status)
