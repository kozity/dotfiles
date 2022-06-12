local module = {}

module.filetypes = {
	[".rs$"] = {
		indent = function()
			vis:command('set expandtab on')
		end,
		run = function(argv, force, win, selection, range)
			vis:message("Unimplemented; let Cargo handle it.")
		end,
		test = function(argv, force, win, selection, range)
			vis:message("Unimplemented; let Cargo handle it.")
		end,
	},
	[".ha$"] = {
		indent = function()
			vis:command('set tabwidth 8')
		end,
		run = function(argv, force, win, selection, range)
			vis:command('!hare run '
				.. table.concat(argv, ' ')
				.. ' $vis_filepath 2>&1 | less')
		end,
		test = function(argv, force, win, selection, range)
			vis:command('!hare test '
				.. table.concat(argv, ' ')
				.. ' 2>&1 | less')
		end,
	},
}

module.mode_strings = {
	[vis.modes.NORMAL]           = ' ',
	[vis.modes.OPERATOR_PENDING] = ' (...) ',
	[vis.modes.INSERT]           = ' (+++) ',
	[vis.modes.REPLACE]          = ' (~~~) ',
	[vis.modes.VISUAL]           = ' (--|) ',
	[vis.modes.VISUAL_LINE]      = ' (==|) ',
}

module.status = function(win)
	-- incrementally construct left side of status line
	local left = module.mode_strings[vis.mode]
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
end

return module
