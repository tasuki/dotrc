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
set showbreak=+
set scrolloff=10     " show 10 lines of context (above and below)
set fillchars+=vert:\  " no bars in vertical split
set updatetime=300   " mostly for tagbar
set nowrap           " wrapping is usually evil
set exrc             " allow current directory .vimrc overrides
syntax on            " syntax highlighting
let mapleader=","    " start shortcuts with coma

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
map gl gt
map gn :tabnew<CR>

" scroll faster with ctrl+p and ctrl+n
map <C-p> 5k
map <C-n> 5j

" switch prev/next buffer
map <F2> :bp<CR>
map <F3> :bn<CR>
" switch to previously edited buffer
map <F4> <C-^>

" open/close tree and tags
map <F5> :NERDTreeToggle<CR>
map <F6> :TagbarToggle<CR>

" stop highlighting search
map <F7> :noh<CR>
" wrapping is not always evil
map <F8> :set wrap!<CR>

" neither is toothpaste
map <F9> :set paste!<CR>

" change pwd to current file directory
map <Leader>cd :cd %:p:h<CR>

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
set fileencodings=utf-8,iso-8859-2,win-1250
" suffixes to get lower priority when doing tab completion
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,
	\.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" extras based on filename
autocmd BufRead,BufNewFile *.{htm,php,phtml}*
	\ set filetype=php.html |
	\ source ~/.vim/html.vim
autocmd BufRead,BufNewFile *.tex source ~/.vim/tex.vim

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
set shiftwidth=4     " shift tab width
set timeoutlen=400   " timeout for shortcuts

" j + k = normal mode
inoremap jk <esc>
inoremap kj <esc>

" make Y consistent with D and C
nmap Y y$

""""""""""""""""""
" plugin settings
" pathogen
runtime bundle/pathogen/autoload/pathogen.vim

" disable taglist if ctags not present
let g:pathogen_disabled = []
if executable('exuberant-ctags') || executable('ctags') || executable('tags')
	set tags+=tags;/ " search for tags file recursively
else
	call add(g:pathogen_disabled, 'taglist')
endif

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" easymotion: single leader + space and backspace shortcuts
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_mapping_f = '<Space>'
let g:EasyMotion_mapping_F = '<Backspace>'

" ctrlp
let g:ctrlp_map = '<Enter>'

" nerdtree
let g:NERDTreeDirArrows = 0
let g:NERDTreeChDirMode = 2

" tagbar
" sort by file order; ascii arrows; don't show php vars
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_type_php  = { 'kinds' : [
	\ 'i:interfaces',
	\ 'c:classes',
	\ 'd:constant definitions',
	\ 'f:functions',
	\ 'j:javascript functions:1'
\ ] }

" turn syntastic off by default
if !exists("g:syntastic_mode_map")
	let g:syntastic_mode_map = {}
endif
let g:syntastic_mode_map['mode'] = 'passive'

" PIV configuration
let g:DisableAutoPHPFolding = 1
" disable piv ftplugin
let loaded_piv = 1

" Rainbows
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" solarized
set background=dark
let g:solarized_termtrans=1
let g:solarized_bold=0
colorscheme solarized

""""""""""""""""""
" local overrides
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
