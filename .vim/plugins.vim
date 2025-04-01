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
if has("nvim-0.10")
	Plug 'nvim-treesitter/nvim-treesitter', { 'tag': 'v0.9.3', 'do': ':TSUpdate' }
	Plug 'stevearc/aerial.nvim', { 'tag': 'v2.5.0' }
elseif has("nvim-0.5")
	Plug 'nvim-treesitter/nvim-treesitter', { 'tag': 'v0.7.2', 'do': ':TSUpdate' }
	Plug 'stevearc/aerial.nvim', { 'commit': 'ee8d7c8ece' }
endif
call plug#end()

delc PlugUpgrade	" don't accidentally upgrade vim-plug

" editorconfig: exclude fzf
let g:EditorConfig_exclude_patterns = ['term://.*']

" FZF

" copy-paste fzf solar colors, from .zshrc, for when running without shell
let $FZF_DEFAULT_OPTS = "" .
	\ "--color fg:12,bg:8,hl:3,fg+:15,bg+:0,hl+:1 " .
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
let g:NERDTreeChDirMode = 2

" Fugitive
autocmd QuickFixCmdPost *grep* cwindow
map <Leader>b :Git blame<CR>

" Commentary
nnoremap <C-/> :Commentary<CR>
vnoremap <C-/> :Commentary<CR>

" Sideways
nnoremap <Leader>h :SidewaysLeft<cr>
nnoremap <Leader>l :SidewaysRight<cr>

" vimwiki
let g:vimwiki_global_ext = 0 " don't hijack all markdown
let g:vimwiki_list = [{'path': '~/data/prog/vitwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_key_mappings = {'lists': 0} " don't hijack gh/gl


" treesitter goodness only nvim 0.5 and up
if has("nvim-0.5")
lua << EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"bash", "vim", "lua", -- the system
		"elm", "haskell", "scala", -- the good
		"php", "python", "ruby", -- the bad
		"html", "css", "javascript", -- the ugly
	},

	sync_install = false,
	auto_install = false,

	highlight = {
		enable = true,
	},

	additional_vim_regex_highlighting = false,
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
