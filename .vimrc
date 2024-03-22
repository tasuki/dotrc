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
set fillchars+=vert:\  " no bars in vertical split
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
" change pwd to current file directory
map <F5> :cd %:p:h<CR>
map <F7> :nohlsearch<CR>
map <F12> :set paste!<CR>

map <Leader>w :set wrap!<CR>
map <Leader>q :q<CR>


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
autocmd BufNewFile,BufRead *.{html,php} source ~/.vim/html.vim
autocmd BufNewFile,BufRead *.tex source ~/.vim/tex.vim
autocmd BufNewFile,BufRead *.md source ~/.vim/md.vim
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
set background=dark         " this is actually light - Xresources is inverted
colorscheme solarized


""""""""""""""""""
" plugin settings

if filereadable("/usr/share/doc/fzf/examples/plugin/fzf.vim")
	source /usr/share/doc/fzf/examples/plugin/fzf.vim
endif

" vim-plug, run `dotrc/install/vim.sh`
call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/sideways.vim', { 'tag': 'v0.4.0' }
Plug 'easymotion/vim-easymotion', { 'tag': 'v3.0.1' }
Plug 'editorconfig/editorconfig-vim', { 'tag': 'v1.2.0' }
Plug 'garbas/vim-snipmate', { 'commit': 'f5a75d0' } " the old one with no deps
Plug 'junegunn/fzf.vim', { 'commit': '87b60bb' }
Plug 'kien/rainbow_parentheses.vim', { 'commit': 'eb8baa5' }
Plug 'preservim/nerdtree', { 'tag': '7.1.2' }
Plug 'tpope/vim-fugitive', { 'tag': 'v3.7' }
Plug 'tpope/vim-surround', { 'tag': 'v2.2' }
Plug 'vimwiki/vimwiki', { 'tag': 'v2.5' }
call plug#end()

delc PlugUpgrade	" don't accidentally upgrade vim-plug

" easymotion
hi link EasyMotionTarget PreProc
hi link EasyMotionShade Comment

let g:EasyMotion_mapping_f = '<Leader>j'
let g:EasyMotion_mapping_F = '<Leader>k'

" editorconfig: exclude fzf
let g:EditorConfig_exclude_patterns = ['term://.*']

" FZF

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
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>
let g:NERDTreeChDirMode = 2

" Fugitive
autocmd QuickFixCmdPost *grep* cwindow
map <Leader>b :Gblame<CR>

" Rainbows
"
" yellow, red, magenta, violet, blue, cyan, green
" :help cterm-colors, see the NR-8 column, add 8 for light
let g:rbpt_colorpairs = [
    \ [ 3, '#b58900'],
    \ [ 9, '#cb4b16'],
    \ [ 5, '#d33682'],
    \ [13, '#6c71c4'],
    \ [ 4, '#268bd2'],
    \ [ 6, '#2aa198'],
    \ [ 2, '#859900'],
    \ ]

" turn off rainbows for vimwiki
au VimEnter * if &ft != "vimwiki" | RainbowParenthesesToggle
au Syntax * if &ft != "vimwiki" | RainbowParenthesesLoadRound
au Syntax * if &ft != "vimwiki" | RainbowParenthesesLoadSquare
au Syntax * if &ft != "vimwiki" | RainbowParenthesesLoadBraces

" Sideways
nnoremap <Leader>h :SidewaysLeft<cr>
nnoremap <Leader>l :SidewaysRight<cr>

" snipmate
let g:snippets_dir = '~/.vim/snippets/'

" vimwiki
let g:vimwiki_global_ext = 0 " don't hijack all markdown
let g:vimwiki_list = [{'path': '~/data/prog/vitwiki', 'syntax': 'markdown', 'ext': '.md'}]
hi def link VimwikiLink pandocLinkLabel
hi def link VimwikiList pandocListMarker
hi def link VimwikiHeader1 pandocHeading
hi def link VimwikiHeader2 pandocHeadingMarker

hi def link htmlH1 pandocHeading
hi def link htmlH2 pandocHeadingMarker
hi def link htmlH3 Title

""""""""""""""""""
" local overrides
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
