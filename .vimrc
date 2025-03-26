" tasuki's .vimrc

""""""""""""""""""""
" interface/display
set nocompatible     " use vim defaults instead of vi compatibility
set nofoldenable     " oh how I hate folding
set wildmenu         " show options for <tab>
set ruler            " show the cursor position all the time
set showcmd          " show (partial) command in status line
set showmatch        " show matching brackets
set ignorecase       " case insensitive matching
set smartcase        " case sensitive matching on mixed case
set incsearch        " incremental search
set hlsearch         " highlight searches
set linebreak
set scrolloff=10     " show 10 lines of context (above and below)
set nowrap           " wrapping is usually evil
set exrc             " allow current directory .vimrc overrides
set mouse=nv         " mouse in normal and visual mode
syntax on            " syntax highlighting
let mapleader=" "    " start shortcuts with a space

" close preview windows on leaving insert mode
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" window title for term and screen
autocmd BufEnter * let &titlestring = "vi " . expand("%:t")
if &term == "screen"
	set t_ts=k
	set t_fs=\
endif
if &term == "screen" || &term == "xterm"
	set title
endif

" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" tabs
map gh gT
map gH :tabm -1<CR>
map gl gt
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
set nowritebackup    " no backup when saving
set autowrite        " autosave before commands like :next and :make
set hidden           " change buffer without saving
set nobackup         " don't keep a backup file
set noswapfile       " swap files are overrated
set history=50       " keep 50 lines of command line history
set viminfo='20,\"50 " don't store more than 50 lines in viminfo
set encoding=utf-8   " output encoding
set fileencodings=utf-8
" suffixes to get lower priority when doing tab completion
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,
	\.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" extras based on filename
autocmd BufNewFile,BufRead *.{html,php} source ~/.vim/mappings/html.vim
autocmd BufNewFile,BufRead *.tex source ~/.vim/mappings/tex.vim
autocmd BufNewFile,BufRead *.md source ~/.vim/mappings/md.vim
autocmd BufNewFile,BufRead *.sc set filetype=scala

" don't outdent # in python
filetype indent on

" sudo write
cmap w!! w !sudo tee % >/dev/null

""""""""""
" editing
set backspace=indent,eol,start " more powerful backspacing
set autoindent       " always set autoindenting on
set smartindent      " try to guess indentation
set textwidth=0      " Don't wrap words by default
set nopaste          " do not start in paste mode
set tabstop=4        " show tabs as 4 spaces
set softtabstop=4    " show tabs as 4 spaces
set shiftwidth=4     " shift tab width
set timeoutlen=400   " timeout for shortcuts

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

" colour scheme
set termguicolors
colorscheme solar

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
