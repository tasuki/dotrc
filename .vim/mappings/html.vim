" shortcuts for writing html

" div & span
vmap <buffer> <leader>div <Esc>`>a</div><Esc>`<i<div class=""><Esc>hi
imap <buffer> <C-L>div <div class=""></div><Esc>F"i
vmap <buffer> <leader>diid <Esc>`>a</div><Esc>`<i<div id=""><Esc>hi
imap <buffer> <C-L>diid <div id=""></div><Esc>F"i
vmap <buffer> <leader>span <Esc>`>a</span><Esc>`<i<span class=""><Esc>hi
imap <buffer> <C-L>span <span class=""></span><Esc>F"i
vmap <buffer> <leader>spaid <Esc>`>a</span><Esc>`<i<span id=""><Esc>hi
imap <buffer> <C-L>spaid <span id=""></span><Esc>F"i

" headings
vmap <buffer> <leader>ha <Esc>`>a</h1><Esc>`<i<h1><Esc>
imap <buffer> <C-L>ha <h1></h1><Esc>F<i
vmap <buffer> <leader>hb <Esc>`>a</h2><Esc>`<i<h2><Esc>
imap <buffer> <C-L>hb <h2></h2><Esc>F<i
vmap <buffer> <leader>hc <Esc>`>a</h3><Esc>`<i<h3><Esc>
imap <buffer> <C-L>hc <h3></h3><Esc>F<i
vmap <buffer> <leader>hd <Esc>`>a</h4><Esc>`<i<h4><Esc>
imap <buffer> <C-L>hd <h4></h4><Esc>F<i

" fonts and stuff
vmap <buffer> <leader>bb <Esc>`>a</strong><Esc>`<i<strong><Esc>
imap <buffer> <C-L>bb <strong></strong><Esc>F<i
vmap <buffer> <leader>ii <Esc>`>a</em><Esc>`<i<em><Esc>
imap <buffer> <C-L>ii <em></em><Esc>F<i
vmap <buffer> <leader>pre <Esc>`>a</pre><Esc>`<i<pre><Esc>
imap <buffer> <C-L>pre <pre></pre><Esc>F<i

" links
vmap <buffer> <leader>aa <Esc>`>a</a><Esc>`<i<a href=""><Left><Left>
imap <buffer> <C-L>aa <a href=""></a><Esc>F"i

" paragraphs
vmap <buffer> <leader>pp <Esc>`>a</p><Esc>`<i<p><Esc>
imap <buffer> <C-L>pp <p></p><Esc>F<i

" img
imap <buffer> <C-L>im <img src="" alt=""/><Esc>3F"i

" table, list
vmap <buffer> <leader>tr <Esc>`>a</td></tr><Esc>`<i<tr><td><Esc>
imap <buffer> <C-L>tr <tr><td></td></tr><Esc>2F<i
vmap <buffer> <leader>td <Esc>`>a</td><Esc>`<i<td><Esc>
imap <buffer> <C-L>td <td></td><Esc>F<i
vmap <buffer> <leader>th <Esc>`>a</td><Esc>`<i<td><Esc>
imap <buffer> <C-L>th <th></th><Esc>F<i
vmap <buffer> <leader>li <Esc>`>a</li><Esc>`<i<li><Esc>
imap <buffer> <C-L>li <li></li><Esc>F<i

" magical tag close, stolen somewhere
imap <buffer> <C-L>. <Esc>F<yef>pa><Esc>F<a/<Left><Left>
