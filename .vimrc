" tasuki's .vimrc

set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

set autoindent		" always set autoindenting on
set smartindent     " try to guess indentation
set textwidth=0		" Don't wrap words by default
set nobackup		" Don't keep a backup file
set directory=~/.vim/swap " don't put swap files all over the place
set viminfo='20,\"50	  " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set nopaste         " do not start in paste mode

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

syntax on " syntax highlighting

filetype plugin on " file type detection

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
"set et             "expand tab, nothing good...
"set noexpandtab
set so=10           " show 10 lines of context (above and below)
set hlsearch        " highlight searches
set fileencodings=utf-8,iso-8859-2,win-1250
set encoding=utf-8

" ,# perl # comments
map ,# :s/^/#/<CR>
" " ,/ C/C++/C#/Java // comments
map ,/ :s/^/\/\//<CR>
" ,< HTML comment
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
" c++ java style comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>


" tab completion when previous char is not a whitespace
function! InsertTabWrapper(direction)
	let col = col('.') - 1
	" !col || strpart(getline('.'), col-1, col) =~ '\s'
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	elseif "backward" == a:direction
		return "\<c-p>"
	else
		return "\<c-n>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

set tm=400 " timeout for shortcuts

" pressing j and k together escapes
inoremap jk <esc>
inoremap kj <esc>

" set gt and gT to switch between buffers instead of tabs
"map gt :bn<CR>
"map gT :bp<CR>

map <F2> :bp<CR>
map <F3> :bn<CR>

autocmd BufRead,BufNewFile *.htm* source ~/.vim/html.vim
autocmd BufRead,BufNewFile *.php* source ~/.vim/html.vim
autocmd BufRead,BufNewFile *.phtml* source ~/.vim/html.vim
autocmd BufRead,BufNewFile *.tex source ~/.vim/tex.vim

"source ~/.vim/minibufexpl.vim