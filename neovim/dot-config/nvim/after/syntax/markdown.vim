" fix highlighting underscores in markdown math mode
syn region math start='\$' skip='\\\$' end='\$'
hi link math Statement
