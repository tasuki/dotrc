imap <buffer> <C-L>tt {\tt }<Left>
vmap <buffer> <leader>tt <Esc>`>a}<Esc>`<i{\tt <Esc>%
imap <buffer> <C-L>bb {\bf }<Left>
vmap <buffer> <leader>bb <Esc>`>a}<Esc>`<i{\bf <Esc>%
imap <buffer> <C-L>ii {\it }<Left>
vmap <buffer> <leader>ii <Esc>`>a}<Esc>`<i{\it <Esc>%

"enclose in czech quotes
imap <buffer> <C-L>uv \uv{}<Left>
vmap <buffer> <leader>uv <Esc>`>a}<Esc>`<i\uv{<Esc>%

"close open \begin{something} by <leader>.
imap <buffer> <C-L>. <Esc>F{lyt}f}a\end{}<Esc>PF\i

"jump before (\) and after (}) TeX constructs
map <M-Right> f}
imap <M-Right> <C-O>f}<Right>
map <M-Left> F\
imap <M-Left> <C-O>F\
