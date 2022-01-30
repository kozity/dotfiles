" MAPPINGS
let mapleader=","
nnoremap <Leader>a <C-^>
nnoremap <Leader>b i─│┌┐└┘<C-[>
nnoremap <Leader>c :cd %:p:h<Return>:pwd<Return>
nnoremap <Leader>m :make<Return>
nnoremap <Leader>n :nohlsearch<Return>
nnoremap <Leader>s :!status<Return>
nnoremap <Leader>t :b term<Return>
nnoremap <Leader>z :let &scrolloff=<C-R>=&scrolloff==0?999:0<CR><CR>
" do not remove indentation when starting a line with '#'
inoremap # X#
inoremap <A-Return> <Return><C-o>^<C-o>D
" terminal mode convenience
"tnoremap <A-[> <C-\><C-n>
tnoremap <C-^> <C-\><C-n><C-^>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
inoremap <A-h> <Esc><C-w>h
inoremap <A-j> <Esc><C-w>j
inoremap <A-k> <Esc><C-w>k
inoremap <A-l> <Esc><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

command Pdf !pandoc % -t pdf | zathura - &
nnoremap <Leader>p :Pdf<Return>

" SETTINGS
set cursorline
set foldmethod=expr
set hidden
set inccommand=nosplit
set lazyredraw
set linebreak
set list " show certain whitespace characters
set mouse=nv
set noexpandtab
set nofoldenable
set nomodeline
set number
set path+=**,
set showmatch
set textwidth=0
" indentation
set breakindent
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4

" COMMANDS (already defined systemwide apparently)
"command MakeTags !ctags --recurse=yes .
"command Make make!

" STATUSLINE
set statusline=
set statusline+=\ %F            " add the full file path to the statusline
set statusline+=\ %m            " display [+] if modified since write
set statusline+=%=              " switch to right side
set statusline+=\ %v:%l/%L      " virtual column number (tabs as spaces) & line number out of total lines
set statusline+=\               " blank space
set shortmess+=F                " don't show filename except in statusline

colorscheme custom

" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" focus mode
let s:focused = 0
function! ToggleFocus()
	if s:focused == 0
		let s:focused = 1
		set laststatus=0
		set nolist
		set nonumber
		set noruler
		set noshowcmd
	else
		let s:focused = 0
		set laststatus=2
		set list
		set number
		set showcmd
	endif
endfunction
nnoremap <C-f> :call ToggleFocus()<Return>
