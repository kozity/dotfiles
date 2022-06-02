-- mappings
vim.g.mapleader = ","
vim.keymap.set("n", "<leader>a", "<c-^>")
vim.keymap.set("n", "<leader>b", "i─│┌┐└┘<C-[>")
vim.keymap.set("n", "<leader>c", "<cmd>cd %:p:h<cr>:pwd<cr>")
vim.keymap.set("n", "<leader>m", "<cmd>make<cr>")
vim.keymap.set("n", "<leader>n", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<leader>s", "<cmd>!status<cr>")
vim.keymap.set("n", "<leader>z", "<cmd>let &scrolloff=<c-r>=&scrolloff==0?999:0<cr><cr>")

-- mappings: telescope
vim.keymap.set("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

-- settings
vim.opt.cursorline = true
vim.opt.expandtab = false
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.hidden = true
vim.opt.inccommand = "nosplit"
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.list = true -- show certain whitespace characters
vim.opt.modeline = false
vim.opt.mouse = "nv"
vim.opt.number = true
vim.opt.path:append({"**,"})
vim.opt.showmatch = true
vim.opt.textwidth = 0

-- settings: indentation
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- settings: statusline
-- %F : add the full file path to the statusline
-- %m : display [+] if modified since write
-- %= : switch to right side
-- %v : virtual column number (tabs as spaces)
-- %l : line number
-- %L : total lines
vim.opt.statusline = " %F %m%= %v:%l/%L "
vim.opt.shortmess:append("F") -- don't show filename except in statusline

vim.cmd("colorscheme custom")

-- netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

-- plugins using vim-plug
local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.local/share/nvim-plugins")

Plug("neovim/nvim-lspconfig")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", {["do"] = "make"})

vim.call("plug#end")

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
