" plugin loading and settings with vim-plug
" to set up, run: `dotrc/install/vim.sh`

call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/sideways.vim', { 'tag': 'v0.4.0' }
Plug 'editorconfig/editorconfig-vim', { 'tag': 'v1.2.0' }
Plug 'junegunn/fzf.vim', { 'commit': '87b60bb' }
Plug 'preservim/nerdtree', { 'tag': '7.1.2' }
Plug 'tpope/vim-commentary', { 'tag': 'v1.3' }
Plug 'tpope/vim-fugitive', { 'tag': 'v3.7' }
Plug 'tpope/vim-surround', { 'tag': 'v2.2' }
Plug 'vimwiki/vimwiki', { 'tag': 'v2.5' }
Plug 'Exafunction/windsurf.vim', { 'commit': 'a8d47ec' }
if has("nvim-0.5")
	if has("nvim-0.10")
		Plug 'nvim-treesitter/nvim-treesitter', { 'tag': 'v0.9.3', 'do': ':TSUpdate' }
		Plug 'nvim-treesitter/nvim-treesitter-context', { 'tag': 'v1.0.0' }
		Plug 'stevearc/aerial.nvim', { 'tag': 'v2.5.0' }
		Plug 'neovim/nvim-lspconfig', { 'tag': 'v1.7.0' }
	else
		Plug 'nvim-treesitter/nvim-treesitter', { 'tag': 'v0.7.2', 'do': ':TSUpdate' }
		Plug 'stevearc/aerial.nvim', { 'commit': 'ee8d7c8ece' }
	endif
	Plug 'norcalli/nvim-colorizer.lua', { 'commit': 'a065833f35' }
	Plug 'vimpostor/vim-lumen/', { 'tag': 'v1.0' }
endif
call plug#end()

delc PlugUpgrade	" don't accidentally upgrade vim-plug

" editorconfig: exclude fzf
let g:EditorConfig_exclude_patterns = ['term://.*']

" FZF

" copy-paste fzf solar colors, from .zshrc, for when running without shell
let $FZF_DEFAULT_OPTS = "" .
	\ "--color fg:12,bg:0,hl:3,fg+:15,bg+:0,hl+:1 " .
	\ "--color info:9,prompt:6,pointer:6,marker:6,spinner:6"

if filereadable("/usr/share/doc/fzf/examples/plugin/fzf.vim")
	source /usr/share/doc/fzf/examples/plugin/fzf.vim
endif

" git grep
command! -bang -nargs=* GG
	\ call fzf#vim#grep2(
	\ 'git grep --ignore-case --line-number -- ',
	\ <q-args>, 0, fzf#vim#with_preview(), <bang>0)

" rip grep
command! -bang -nargs=* RG
	\ call fzf#vim#grep2(
	\ "rg --column --line-number --no-heading --color=always --hidden --smart-case -- ",
	\ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

nmap <Leader><Enter> :GFiles<CR>
nmap <Leader>. :Files<CR>
nmap <Leader>r :RG<CR>
nmap <Leader>g :GG<CR>
nmap <Leader>/ :execute ':RG ' . expand('<cword>')<CR>

" nerdtree
map <F5> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>
let g:NERDTreeChDirMode = 0 " do not change pwd everrr

" Fugitive
map <Leader>b :Git blame<CR>

" Commentary
nnoremap <C-/> :Commentary<CR>
vnoremap <C-/> :Commentary<CR>
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" Sideways
nnoremap <Leader>h :SidewaysLeft<cr>
nnoremap <Leader>l :SidewaysRight<cr>

" vimwiki
let g:vimwiki_list = [{'path': '~/data/prog/vitwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_key_mappings = {'lists': 0} " don't hijack gh/gl
let g:vimwiki_conceallevel = 0 " do not hide markup

" windsurf / codeium
let g:codeium_manual = v:true

" treesitter goodness only nvim 0.5 and up
if has("nvim-0.5")
lua << EOF
require'colorizer'.setup()

require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"bash", "vim", "lua", -- the system
		"elm", "haskell", "scala", -- the good
		"php", "python", "ruby", -- the bad
		"html", "css", "javascript", "typescript", -- the ugly
		"c", "cpp", -- the old skool
	},

	sync_install = false,
	auto_install = false,

	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
}

require('aerial').setup {
	on_attach = function(bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F6>', '<cmd>AerialToggle!<CR>', {})
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrev<CR>', {})
		vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNext<CR>', {})
	end
}
EOF
endif

" lsp only nvim 0.10 and up
" https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
if has("nvim-0.10")
lua << EOF
vim.keymap.set('n', '<leader>a', function()
	vim.lsp.buf.code_action({
		filter = function(action)
			return action.title:match('Add inferred annotation')
		end,
		apply = true
	})
end)
vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set('n', 'gd', function() vim.cmd('vsplit | wincmd l') vim.lsp.buf.definition() end, { noremap = true, silent = true })
vim.keymap.set('n', 'gt', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { noremap = true, silent = true })
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set('n', 'gm', vim.diagnostic.open_float, { noremap = true, silent = true })

require'lspconfig'.elmls.setup{}

require'treesitter-context'.setup {
	enable = true,
}
EOF
endif
