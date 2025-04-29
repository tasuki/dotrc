" shortcuts for writing markdown

vmap <buffer> <leader>aa <Esc>`>a]()<Esc>`<i[<Esc>f(a
imap <buffer> <C-L>aa []()<Esc>F]i
vmap <buffer> <leader>bb <Esc>`>a**<Esc>`<i**<Esc><Right>
imap <buffer> <C-L>bb ****<Esc>hi
vmap <buffer> <leader>ii <Esc>`>a_<Esc>`<i_<Esc><Right>
imap <buffer> <C-L>ii **<Esc>i

" continue lists on enter
inoremap <silent><buffer> <CR> <C-]><Esc>:VimwikiReturn 1 5<CR>
inoremap <silent><buffer> <S-CR> <Esc>:VimwikiReturn 2 2<CR>
