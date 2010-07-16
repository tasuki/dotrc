imap ,tt {\tt }<Left>
vmap ,tt <Esc>`>a}<Esc>`<i{\tt <Esc>%
imap ,bb {\bf }<Left>
vmap ,bb <Esc>`>a}<Esc>`<i{\bf <Esc>%
imap ,ii {\it }<Left>
vmap ,ii <Esc>`>a}<Esc>`<i{\it <Esc>%


"uzavøení do uvozovek
imap ,uv \uv{}<Left>
vmap ,uv <Esc>`>a}<Esc>`<i\uv{<Esc>%

"uzavøení; napi¹te \begin{cosi} a pou¾ijte ,.
imap ,. <Esc>F{lyt}f}a\end{}<Esc>PF\i

"poskakuje pøed (\) a za (}) TeXovské konstrukce
map <M-Right> f}
imap <M-Right> <C-O>f}<Right>
map <M-Left> F\
imap <M-Left> <C-O>F\
