-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
	vis:command('set theme custom')
	
	vis:command_register('test', function(argv, force, win, selection, range)
		local msg = ''
		for i, arg in ipairs(argv) do
			msg = msg .. i .. ': ' .. arg .. '\n'
		end
		msg = msg .. 'was command forced with ! ' .. (force and 'yes' or 'no') .. '\n'
		if win.file.name == nil then
			msg = msg .. 'no file name' .. '\n'
		else
			msg = msg .. win.file.name .. '\n'
		end
		msg = msg .. selection.pos .. '\n'
		msg = msg .. (range ~= nil and ('[' .. range.start .. ', ' .. range.finish .. ']') or 'invalid range') .. '\n'
		if win.file.modified then
			msg = msg .. 'file has been modified' .. '\n'
		else
			msg = msg .. 'file has not been modified' .. '\n'
		end
		vis:message(msg)
		return true;
	end)
end)

vis.events.subscribe(vis.events.FILE_OPEN, function(file)
	-- set proper expandtab based on language conventions
	local name = file.name
	if name ~= nil and string.find(name, ".rs$") ~= nil then
		vis:command('set expandtab on')
	else
		vis:command('set expandtab off')
	end
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command('set autoindent on')
	vis:command('set number')
	vis:command('set show-tabs on')
	vis:command('set tabwidth 4')
end)

-- for statusline
local mode_string = {
	[vis.modes.NORMAL]           = ' ',
	[vis.modes.OPERATOR_PENDING] = ' (pending) ',
	[vis.modes.INSERT]           = ' (insert) ',
	[vis.modes.REPLACE]          = ' (replace) ',
	[vis.modes.VISUAL]           = ' (visual) ',
	[vis.modes.VISUAL_LINE]      = ' (visual line) ',
}

vis.events.subscribe(vis.events.WIN_STATUS, function(win)
	-- incrementally construct left side of status line
	local left = mode_string[vis.mode]
	if win.file.path ~= nil then
		left = left .. win.file.path
	else
		left = left .. '(no name)'
	end
	if win.file.modified then
		left = left .. ' (+)'
	end

	-- right side
	local col = win.selection.col
	local line = win.selection.line
	local lines = #(win.file.lines)
	local right = col .. ':' .. line .. '/' .. lines .. ' '

	win:status(left, right)
end)
