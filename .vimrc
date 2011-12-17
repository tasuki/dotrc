" tasuki's .vimrc

set nocompatible     " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start " more powerful backspacing

set autoindent       " always set autoindenting on
set smartindent      " try to guess indentation
set textwidth=0      " Don't wrap words by default
set nobackup         " Don't keep a backup file
set nowb             " no backup when saving
set noswapfile       " swap files are overrated
set viminfo='20,\"50 " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50       " keep 50 lines of command line history
set ruler            " show the cursor position all the time
set nopaste          " do not start in paste mode
set nofoldenable     " oh how I hate folding
set wildmenu         " show options for <tab>
set hidden           " change buffer without saving

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

syntax on           " syntax highlighting
filetype plugin on  " file type detection

set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make

set showbreak=+
set linebreak
set tabstop=4
set softtabstop=4
set shiftwidth=4
set so=10           " show 10 lines of context (above and below)
set hlsearch        " highlight searches
set fileencodings=utf-8,iso-8859-2,win-1250
set encoding=utf-8

" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" set title for term and screen
autocmd BufEnter * let &titlestring = "vi " . expand("%:t")
if &term == "screen"
	set t_ts=k
	set t_fs=\
endif
if &term == "screen" || &term == "xterm"
	set title
endif

let mapleader = ","
" ,# perl # comments
map <leader># :s/^/#/<CR>
" " ,/ C/C++/C#/Java // comments
map <leader>/ :s/^/\/\//<CR>
" ,< HTML comment
map <leader>< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
" c++ java style comments
map <leader>* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>

set tm=400 " timeout for shortcuts

" make Y consistent with D and C
nmap Y y$

" sudo write
cmap w!! w !sudo tee % >/dev/null

" pressing j and k together escapes
inoremap jk <esc>
inoremap kj <esc>

map <F2> :bp<CR>
map <F3> :bn<CR>

" change pwd to current file directory
map <F8> :cd %:p:h<CR>

autocmd BufRead,BufNewFile *.htm* source ~/.vim/html.vim
autocmd BufRead,BufNewFile *.php* source ~/.vim/html.vim
autocmd BufRead,BufNewFile *.phtml* source ~/.vim/html.vim
autocmd BufRead,BufNewFile *.tex source ~/.vim/tex.vim

" pathogen
let g:pathogen_disabled = []
if executable('exuberant-ctags') || executable('ctags') || executable('tags')
	" search for tags file recursively
	set tags+=tags;/
else
	call add(g:pathogen_disabled, 'taglist')
endif

let g:LustyJugglerSuppressRubyWarning = 1
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Show_One_File = 1
let tlist_php_settings = 'php;c:class;f:function;d:constant;v:variable'

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

map <F5> :NERDTreeToggle<CR>
map <F6> :TlistToggle<CR>

if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
