" MAPPINGS
let mapleader=","
nnoremap <leader>a <c-^>
nnoremap <leader>b i─│┌┐└┘<C-[>
nnoremap <leader>c <cmd>cd %:p:h<cr>:pwd<cr>
nnoremap <leader>m <cmd>make<cr>
nnoremap <leader>n <cmd>nohlsearch<cr>
nnoremap <leader>s <cmd>!status<cr>
nnoremap <leader>z <cmd>let &scrolloff=<c-r>=&scrolloff==0?999:0<cr><cr>

" MAPPINGS - telescope
nnoremap <leader>/ <cmd>Telescope current_buffer_fuzzy_find<cr>

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

" plugins with vim-plug
call plug#begin('~/.local/share/nvim-plugins/')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

lua << EOF
require('lspconfig').rust_analyzer.setup{
	on_attach = function()
		vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {buffer = 0})
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {buffer = 0})
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, {buffer = 0})
		vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer = 0})
		vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer = 0})
	end
}

require('telescope').load_extension('fzf')
EOF
