" shortcuts for writing html

" div & span
vmap <leader>div <Esc>`>a</div><Esc>`<i<div class=""><Esc>hi
imap <leader>div <div class=""></div><Esc>F"i
vmap <leader>diid <Esc>`>a</div><Esc>`<i<div id=""><Esc>hi
imap <leader>diid <div id=""></div><Esc>F"i
vmap <leader>span <Esc>`>a</span><Esc>`<i<span class=""><Esc>hi
imap <leader>span <span class=""></span><Esc>F"i
vmap <leader>spaid <Esc>`>a</span><Esc>`<i<span id=""><Esc>hi
imap <leader>spaid <span id=""></span><Esc>F"i

" headings
vmap <leader>ha <Esc>`>a</h1><Esc>`<i<h1><Esc>
imap <leader>ha <h1></h1><Esc>F<i
vmap <leader>hb <Esc>`>a</h2><Esc>`<i<h2><Esc>
imap <leader>hb <h2></h2><Esc>F<i
vmap <leader>hc <Esc>`>a</h3><Esc>`<i<h3><Esc>
imap <leader>hc <h3></h3><Esc>F<i
vmap <leader>hd <Esc>`>a</h4><Esc>`<i<h4><Esc>
imap <leader>hd <h4></h4><Esc>F<i

" fonts and stuff
vmap <leader>bb <Esc>`>a</strong><Esc>`<i<strong><Esc>
imap <leader>bb <strong></strong><Esc>F<i
vmap <leader>ii <Esc>`>a</em><Esc>`<i<em><Esc>
imap <leader>ii <em></em><Esc>F<i
vmap <leader>pre <Esc>`>a</pre><Esc>`<i<pre><Esc>
imap <leader>pre <pre></pre><Esc>F<i

" links
vmap <leader>aa <Esc>`>a</a><Esc>`<i<a href=""><Left><Left>
imap <leader>aa <a href=""></a><Esc>F"i

" paragraphs
vmap <leader>pp <Esc>`>a</p><Esc>`<i<p><Esc>
imap <leader>pp <p></p><Esc>F<i

" table, list
vmap <leader>tr <Esc>`>a</td></tr><Esc>`<i<tr><td><Esc>
imap <leader>tr <tr><td></td></tr><Esc>2F<i
vmap <leader>td <Esc>`>a</td><Esc>`<i<td><Esc>
imap <leader>td <td></td><Esc>F<i
vmap <leader>th <Esc>`>a</td><Esc>`<i<td><Esc>
imap <leader>th <th></th><Esc>F<i
vmap <leader>li <Esc>`>a</li><Esc>`<i<li><Esc>
imap <leader>li <li></li><Esc>F<i

" magical tag close, stolen somewhere
imap <leader>. <Esc>F<yef>pa><Esc>F<a/<Left><Left>

let php_sql_query=1
let php_htmlInStrings=1
let php_folding=1
