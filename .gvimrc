" tasuki's short .gvimrc

" make vim look like vim
set guioptions=

" disable chinese water torture
" (http://www.jurta.org/en/prog/noblink)
set guicursor=a:blinkon0

" favourite fixed width typeface
set guifont=Ubuntu\ Mono\ 15

" this should really be set in ~/.vimrc but that breaks things
set background=light
let g:solarized_bold=1

" make solarized tab colors awesome
hi Title       cterm=bold gui=bold ctermfg=1
hi TablineSel  cterm=bold gui=bold ctermfg=0 ctermbg=7
hi Tabline     cterm=bold gui=bold ctermfg=7 ctermbg=0
hi TablineFill cterm=bold gui=bold ctermfg=7 ctermbg=0
