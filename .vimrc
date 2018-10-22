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
"set showbreak=>>>\   " nicer long line breaks, also see https://retracile.net/wiki/VimBreakIndent
set scrolloff=10     " show 10 lines of context (above and below)
set fillchars+=vert:\  " no bars in vertical split
set updatetime=300   " mostly for tagbar
set nowrap           " wrapping is usually evil
set exrc             " allow current directory .vimrc overrides
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
map gl gt
map gn :tabnew<CR>

" scroll faster with ctrl+p and ctrl+n
map <C-p> 5k
map <C-n> 5j

" switch to previously edited buffer
map <F4> <C-^>
" stop highlighting search
map <F7> :noh<CR>

map <Leader>w :set wrap!<CR>
map <Leader>p :set paste!<CR>
map <Leader>q :q<CR>

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
	\ set filetype=php |
	\ source ~/.vim/html.vim
autocmd BufRead,BufNewFile *.tex source ~/.vim/tex.vim

" .md is markdown fer shure
autocmd BufNewFile,BufRead *.md set filetype=markdown

" don't outdent # in python
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

autocmd BufNewFile,BufRead *.feature setlocal ts=2 sts=2 sw=2

" sudo write
cmap w!! w !sudo tee % >/dev/null

" copy to system clipboard
vnoremap <c-c> !tee >(xsel -i -b)<cr>

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
map <Leader>v "*p
vmap <Leader>c "*y


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

call pathogen#infect()
call pathogen#helptags()

" vim-ack
if executable("ag")
	let g:ackprg = 'ag -U --nogroup --nocolor --column'
	let g:ctrlp_user_command = 'ag %s --files-with-matches --skip-vcs-ignores --nocolor -g ""'
	nnoremap <Leader>a * :Ack<cr>
endif

" ctrlp
let g:ctrlp_map = '<Enter>'
let g:ctrlp_max_files = 0
let g:ctrlp_switch_buffer = 0

" nerdtree
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>
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

" Fugitive
autocmd QuickFixCmdPost *grep* cwindow

" Rainbows
"
" yellow, red, magenta, violet, blue, cyan, green
" only '3' works for yellow in rxvt
" only 'magenta' works for magenta in xterm
let g:rbpt_colorpairs = [
    \ [ 3, '#b58900'],
    \ [ 1, '#dc322f'],
    \ [ 5, '#d33682'],
    \ ['magenta', '#6c71c4'],
    \ [ 4, '#268bd2'],
    \ [ 6, '#2aa198'],
    \ [ 2, '#859900'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" PHP manual
let g:php_manual_online_search_shortcut = 'H'

" Sideways
nnoremap <Leader>h :SidewaysLeft<cr>
nnoremap <Leader>l :SidewaysRight<cr>

" solarized
set background=dark
let g:solarized_termtrans=1
let g:solarized_bold=0
colorscheme solarized

" make solarized tab colors awesome
hi Title       cterm=bold gui=bold ctermfg=1
hi TablineSel  cterm=bold gui=bold ctermfg=0 ctermbg=7
hi Tabline     cterm=bold gui=bold ctermfg=7 ctermbg=0
hi TablineFill cterm=bold gui=bold ctermfg=7 ctermbg=0

""""""""""""""""""
" local overrides
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
