imap <leader>tt {\tt }<Left>
vmap <leader>tt <Esc>`>a}<Esc>`<i{\tt <Esc>%
imap <leader>bb {\bf }<Left>
vmap <leader>bb <Esc>`>a}<Esc>`<i{\bf <Esc>%
imap <leader>ii {\it }<Left>
vmap <leader>ii <Esc>`>a}<Esc>`<i{\it <Esc>%


"uzavøení do uvozovek
imap <leader>uv \uv{}<Left>
vmap <leader>uv <Esc>`>a}<Esc>`<i\uv{<Esc>%

"uzavøení; napi¹te \begin{cosi} a pou¾ijte ,.
imap <leader>. <Esc>F{lyt}f}a\end{}<Esc>PF\i

"poskakuje pøed (\) a za (}) TeXovské konstrukce
map <M-Right> f}
imap <M-Right> <C-O>f}<Right>
map <M-Left> F\
imap <M-Left> <C-O>F\
