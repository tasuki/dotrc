" tasuki's .vimrc

""""""""""""""""""""
" interface/display
set nofoldenable     " oh how I hate folding
set ignorecase       " case insensitive matching
set smartcase        " case sensitive matching on mixed case
set incsearch        " incremental search, default on in nvim
set hlsearch         " highlight searches, default on in nvim
set linebreak        " don't break words
set scrolloff=10     " show 10 lines of context (above and below)
set nowrap           " wrapping is usually evil
set exrc             " allow current directory .vimrc overrides
set mouse=nv         " mouse in normal and visual mode
let mapleader=" "    " start shortcuts with a space

" close preview windows on leaving insert mode, useful for lsp
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" tabs
map gh :tabp<CR>
map gl :tabn<CR>
map gH :tabm -1<CR>
map gL :tabm +1<CR>
map gn :tabnew<CR>
map gc :tabclose<CR>

" scroll faster with ctrl+p and ctrl+n
map <C-p> 5k
map <C-n> 5j

" switch to previously edited buffer
map <F4> <C-^>
map <F7> :nohlsearch<CR>
" change pwd to current file directory
map <F8> :cd %:p:h<CR>
map <F12> :set paste!<CR>

map <Leader>w :set wrap!<CR>
map <Leader>q :q<CR>
map <Leader>x :wq<CR>


""""""""""""""""""
" file operations
filetype plugin on   " file type detection
set autowrite        " autosave before commands like :next and :make
set hidden           " change buffer without saving
set noswapfile       " swap files are overrated

" extras based on filename
autocmd BufNewFile,BufRead *.{html,php} source ~/.vim/mappings/html.vim
autocmd BufNewFile,BufRead *.md  source ~/.vim/mappings/md.vim
autocmd BufNewFile,BufRead *.py  source ~/.vim/mappings/py.vim
autocmd BufNewFile,BufRead *.tex source ~/.vim/mappings/tex.vim

" sudo write
" broken in nvim for 10 years: https://github.com/neovim/neovim/issues/1496
cmap w!! w !sudo tee % >/dev/null


""""""""""
" editing
set smartindent      " try to guess indentation
set tabstop=4        " show tabs as 4 spaces
set softtabstop=4    " show tabs as 4 spaces
set shiftwidth=4     " shift tab width
set timeoutlen=400   " timeout for shortcuts
set completeopt=menu,menuone,preview,noselect " show menu and don't select anything

" j + k = normal mode
inoremap jk <esc>
inoremap kj <esc>

" make Y consistent with D and C
nmap Y y$

" copying and pasting
vnoremap <Leader>y "*y
noremap <Leader>p "*p
vnoremap <Leader>c "+y
noremap <Leader>v "+p

" quickfix
autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType qf nnoremap <buffer> <silent> p <CR><C-w>p

" colour scheme
set termguicolors
colorscheme solar

""""""""""""""""""""""""
" per-language settings

" :h ft-python-indent
let g:python_indent = {}
let g:python_indent.open_paren = 'shiftwidth()'
let g:python_indent.closed_paren_align_last_line = v:false

""""""""""""""""""
" plugin settings

if filereadable(expand("~/.vim/autoload/plug.vim"))
	source ~/.vim/plugins.vim
else
	echom "No vim-plug found: no plugins loaded."
endif

""""""""""""""""""
" local overrides
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif

" per-project overrides
if filereadable(getcwd() . "/.vimrc.local")
	execute "source " . getcwd() . "/.vimrc.local"
endif
