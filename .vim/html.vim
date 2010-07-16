" this file contains shortcuts for writing html and php

" html part:

" div & span
imap ,div <div class=""><CR></div><Esc>k$hi
vmap ,div <Esc>`>a</div><Esc>`<i<div class=""><Esc>hi
imap ,diid <div id=""><CR></div><Esc>k$hi
vmap ,diid <Esc>`>a</div><Esc>`<i<div id=""><Esc>hi
imap ,span <span class=""></span><Esc>8hi
vmap ,span <Esc>`>a</span><Esc>`<i<span class=""><Esc>hi
imap ,spaid <span id=""></span><Esc>8hi
vmap ,spaid <Esc>`>a</span><Esc>`<i<span id=""><Esc>hi

" headings
imap ,ha <h1></h1><Esc>4hi
vmap ,ha <Esc>`>a</h1><Esc>`<i<h1><Esc>
imap ,hb <h2></h2><Esc>4hi
vmap ,hb <Esc>`>a</h2><Esc>`<i<h2><Esc>
imap ,hc <h3></h3><Esc>4hi
vmap ,hc <Esc>`>a</h3><Esc>`<i<h3><Esc>
imap ,hd <h4></h4><Esc>4hi
vmap ,hd <Esc>`>a</h4><Esc>`<i<h4><Esc>

" fonts and stuff
imap ,bb <strong></strong><Esc>F>a
vmap ,bb <Esc>`>a</strong><Esc>`<i<strong><Esc>
imap ,ii <em></em><Esc>F>a
vmap ,ii <Esc>`>a</em><Esc>`<i<em><Esc>
imap ,tt <tt></tt><Esc>4hi
vmap ,tt <Esc>`>a</tt><Esc>`<i<tt><Esc>

imap ,pre <pre><CR><CR></pre><Up>
vmap ,pre <Esc>`>a</pre><Esc>`<i<pre><Esc>

" links
imap ,aa <a href=""></a><C-O>F"
vmap ,aa <Esc>`>a</a><Esc>`<i<a href=""><Left><Left>

" paragraphs
imap ,pp <p></p><Esc>3hi
vmap ,pp <Esc>`>a</p><Esc>`<i<p><Esc>
imap ,br <br/>

" table, img, lists
imap ,tab <table><CR><tr><td></td><td></td></tr><CR></table><Esc>k02f>a
imap ,tr <tr><td></td></tr><Esc>9hi
vmap ,tr <Esc>`>a</td></tr><Esc>`<i<tr><td><Esc>
imap ,td <td></td><Esc>4hi
vmap ,td <Esc>`>a</td><Esc>`<i<td><Esc>
imap ,th <th></th><Esc>4hi
vmap ,th <Esc>`>a</td><Esc>`<i<td><Esc>

imap ,img <img src="" alt=""/><Esc>9hi

imap ,ul <ul><CR><li></li><CR></ul><Esc>ki
imap ,ol <ol><CR><li></li><CR></ol><Esc>ki
imap ,li <li></li><Esc>4hi
vmap ,li <Esc>`>a</li><Esc>`<i<li><Esc>

" magical close, stolen somewhere
imap ,. <Esc>F<yef>pa><Esc>F<a/<Left><Left>

" no idea what this is good for...
"map <M-Right> f>
"imap <M-Right> <C-O>f><Right>
"map <M-Left> F<
"imap <M-Left> <C-O>F<

imap ,starthtml <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"<CR>"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><CR><html xmlns="http://www.w3.org/1999/xhtml"><CR><head><CR><title></title><CR><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><CR></head><CR><body><CR><CR></body><CR></html><Esc>2ki


" entitties (pun fully intended)
imap ,amp &amp;
imap ,ndash &ndash;
imap ,mdash &mdash;
imap ,lsq $lsquo;
imap ,rsq $rsquo;
imap ,lq $ldquo;
imap ,rq $rdquo;


"""""""""""""""""""""""""
" php stuff starts here:

imap ,if if () {<CR>}<Esc>2k$2hi
imap ,while while () {<CR>}<Esc>2k$2hi
imap ,for for () {<CR>}<Esc>2k$2hi
imap ,switch switch () {<CR>}<Esc>2k$2hi

"imap " ""<Esc>i
"imap ( ()<Esc>i

let php_sql_query=1
let php_htmlInStrings=1
let php_folding=1
