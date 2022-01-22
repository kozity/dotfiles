if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "custom"
set background=dark

let s:black      = "0"
let s:red        = "1"
let s:green      = "2"
let s:yellow     = "3"
let s:blue       = "4"
let s:magenta    = "5"
let s:cyan       = "6"
let s:white      = "7"
let s:br_black   = "8"
let s:br_red     = "9"
let s:br_green   = "10"
let s:br_yellow  = "11"
let s:br_blue    = "12"
let s:br_magenta = "13"
let s:br_cyan    = "14"
let s:br_white   = "15"

let s:bold               = "bold,"
let s:italic             = "italic,"
let s:underline          = "underline,"

function! s:hi(group, ctermfg, ctermbg, attr)
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", s:bold)
call s:hi("Italic", "", "", s:italic)
call s:hi("Underline", "", "", s:underline)

"+--- Editor ---+
call s:hi("ColorColumn",	"NONE",	s:br_black,	"")
call s:hi("Cursor",	"",	"NONE",	"")
call s:hi("CursorLine",	"NONE",	s:br_black,	"none")
call s:hi("CursorLineNr",	s:br_yellow,	"",	"Bold")
call s:hi("Error",	"",	s:red,	"")
call s:hi("iCursor",	"",	"NONE",	"")
call s:hi("LineNr",	s:blue,	"NONE",	"")
call s:hi("MatchParen",	s:black,	s:br_blue,	"")
call s:hi("NonText",	s:br_black,	"",	"")
call s:hi("Normal",	"NONE",	"NONE",	"")
call s:hi("PMenu",	s:br_white,	s:br_black,	"NONE")
call s:hi("PmenuSbar",	"NONE",	s:br_black,	"")
call s:hi("PMenuSel",	s:br_blue,	s:br_black,	s:bold)
call s:hi("PmenuThumb",	"NONE",	"NONE",	"")
call s:hi("SpecialKey",	s:yellow,	"",	"")
call s:hi("SpellBad",	s:red,	"NONE",	"undercurl")
call s:hi("SpellCap",	s:br_red,	"NONE",	"undercurl")
call s:hi("SpellLocal",	"NONE",	"NONE",	"undercurl")
call s:hi("SpellRare",	"NONE",	"NONE",	"NONE")
call s:hi("Visual",	s:black,	s:white,	"")
call s:hi("VisualNOS",	"",	s:br_black,	"")
"+- Neovim Support -+
call s:hi("healthError",	s:red,	s:br_black,	"")
call s:hi("healthSuccess",	s:br_green,	s:br_black,	"")
call s:hi("healthWarning",	s:br_red,	s:br_black,	"")
call s:hi("TermCursorNC",	"",	s:br_black,	"")

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0  = s:black
  let g:terminal_color_1  = s:red
  let g:terminal_color_2  = s:green
  let g:terminal_color_3  = s:yellow
  let g:terminal_color_4  = s:blue
  let g:terminal_color_5  = s:magenta
  let g:terminal_color_6  = s:cyan
  let g:terminal_color_7  = s:white
  let g:terminal_color_8  = s:br_black
  let g:terminal_color_9  = s:br_red
  let g:terminal_color_10 = s:br_green
  let g:terminal_color_11 = s:br_yellow
  let g:terminal_color_12 = s:br_blue
  let g:terminal_color_13 = s:br_magenta
  let g:terminal_color_14 = s:br_cyan
  let g:terminal_color_15 = s:br_white
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "NONE", s:br_black, "")
call s:hi("Folded", s:blue, s:br_black, s:bold)
call s:hi("FoldColumn", s:br_cyan, "NONE", "")
call s:hi("SignColumn", s:br_cyan, "NONE", "")

"+--- Navigation ---+
call s:hi("Directory", s:br_blue, "NONE", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:br_black, "NONE", "")
call s:hi("ErrorMsg", s:black, s:red, "")
call s:hi("ModeMsg", "", "", "")
call s:hi("MoreMsg", s:br_blue, "", "")
call s:hi("Question", s:br_magenta, "", "")
call s:hi("StatusLine", s:black, s:blue, s:bold)
call s:hi("StatusLineNC", s:blue, s:br_black, "NONE")
call s:hi("WarningMsg", s:black,	s:yellow, "")
call s:hi("WildMenu", s:br_blue, s:br_black, "")

"+--- Search ---+
call s:hi("IncSearch", s:black, s:br_cyan, s:bold)
call s:hi("Search", s:br_white, s:cyan, "NONE")

"+--- Tabs ---+
call s:hi("TabLine", "NONE", s:br_black, "NONE")
call s:hi("TabLineFill", "NONE", s:br_black, "NONE")
call s:hi("TabLineSel", s:br_cyan, s:br_black,	s:bold)

"+--- Window ---+
call s:hi("Title", "NONE", "", "NONE")

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:white, "", "")
call s:hi("Character", s:white, "", "")
call s:hi("Comment", s:blue, "", s:italic)
call s:hi("Conditional", s:white, "", "")
call s:hi("Constant", "NONE", "", "")
call s:hi("Define", s:white, "", "")
call s:hi("Delimiter", s:white, "", "")
call s:hi("Exception", s:white, "", "")
call s:hi("Float", s:white, "", "")
call s:hi("Function", s:white, "", "")
call s:hi("Identifier", "NONE", "", "NONE")
call s:hi("Include", s:white, "", "")
call s:hi("Keyword", s:white, "", "")
call s:hi("Label", s:white, "", "")
call s:hi("Number", s:white, "", "")
call s:hi("Operator", s:white, "", "NONE")
call s:hi("PreProc", s:white, "", "NONE")
call s:hi("Repeat", s:white, "", "")
call s:hi("Special", "NONE", "", "")
call s:hi("SpecialChar", s:white, "", "")
call s:hi("SpecialComment", s:magenta, "", s:italic)
call s:hi("Statement", s:white, "", "")
call s:hi("StorageClass", s:white, "", "")
call s:hi("String", s:white, "", "")
call s:hi("Structure", s:white, "", "")
call s:hi("Tag", "", "", "")
call s:hi("Todo", s:yellow, "NONE", "")
call s:hi("Type", s:white, "", "NONE")
call s:hi("Typedef", s:white, "", "")
hi! link Macro Define
hi! link PreCondit PreProc
