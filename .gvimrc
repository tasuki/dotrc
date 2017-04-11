" tasuki's short .gvimrc

" make vim look like vim
set guioptions=

" disable chinese water torture
" (http://www.jurta.org/en/prog/noblink)
set guicursor=a:blinkon0

" friendlier than MS Consolas
set guifont=Ubuntu\ Mono\ 12

" ctrl+insert and shift-insert for copying and pasting
map <S-Ins> <MiddleMouse>
vmap <C-Ins> "+y
