" shortcuts for writing html

" div & span
vmap <leader>div <Esc>`>a</div><Esc>`<i<div class=""><Esc>hi
vmap <leader>diid <Esc>`>a</div><Esc>`<i<div id=""><Esc>hi
vmap <leader>span <Esc>`>a</span><Esc>`<i<span class=""><Esc>hi
vmap <leader>spaid <Esc>`>a</span><Esc>`<i<span id=""><Esc>hi

" headings
vmap <leader>ha <Esc>`>a</h1><Esc>`<i<h1><Esc>
vmap <leader>hb <Esc>`>a</h2><Esc>`<i<h2><Esc>
vmap <leader>hc <Esc>`>a</h3><Esc>`<i<h3><Esc>
vmap <leader>hd <Esc>`>a</h4><Esc>`<i<h4><Esc>

" fonts and stuff
vmap <leader>bb <Esc>`>a</strong><Esc>`<i<strong><Esc>
vmap <leader>ii <Esc>`>a</em><Esc>`<i<em><Esc>
vmap <leader>pre <Esc>`>a</pre><Esc>`<i<pre><Esc>

" links
vmap <leader>aa <Esc>`>a</a><Esc>`<i<a href=""><Left><Left>

" paragraphs
vmap <leader>pp <Esc>`>a</p><Esc>`<i<p><Esc>

" table, list
vmap <leader>tr <Esc>`>a</td></tr><Esc>`<i<tr><td><Esc>
vmap <leader>td <Esc>`>a</td><Esc>`<i<td><Esc>
vmap <leader>th <Esc>`>a</td><Esc>`<i<td><Esc>
vmap <leader>li <Esc>`>a</li><Esc>`<i<li><Esc>

" magical tag close, stolen somewhere
imap <leader>. <Esc>F<yef>pa><Esc>F<a/<Left><Left>

let php_sql_query=1
let php_htmlInStrings=1
let php_folding=1
