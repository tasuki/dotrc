" this file contains shortcuts for writing html and php

" html part:

" div & span
imap <leader>div <div class=""><CR></div><Esc>k$hi
vmap <leader>div <Esc>`>a</div><Esc>`<i<div class=""><Esc>hi
imap <leader>diid <div id=""><CR></div><Esc>k$hi
vmap <leader>diid <Esc>`>a</div><Esc>`<i<div id=""><Esc>hi
imap <leader>span <span class=""></span><Esc>8hi
vmap <leader>span <Esc>`>a</span><Esc>`<i<span class=""><Esc>hi
imap <leader>spaid <span id=""></span><Esc>8hi
vmap <leader>spaid <Esc>`>a</span><Esc>`<i<span id=""><Esc>hi

" headings
imap <leader>ha <h1></h1><Esc>4hi
vmap <leader>ha <Esc>`>a</h1><Esc>`<i<h1><Esc>
imap <leader>hb <h2></h2><Esc>4hi
vmap <leader>hb <Esc>`>a</h2><Esc>`<i<h2><Esc>
imap <leader>hc <h3></h3><Esc>4hi
vmap <leader>hc <Esc>`>a</h3><Esc>`<i<h3><Esc>
imap <leader>hd <h4></h4><Esc>4hi
vmap <leader>hd <Esc>`>a</h4><Esc>`<i<h4><Esc>

" fonts and stuff
imap <leader>bb <strong></strong><Esc>F>a
vmap <leader>bb <Esc>`>a</strong><Esc>`<i<strong><Esc>
imap <leader>ii <em></em><Esc>F>a
vmap <leader>ii <Esc>`>a</em><Esc>`<i<em><Esc>
imap <leader>tt <tt></tt><Esc>4hi
vmap <leader>tt <Esc>`>a</tt><Esc>`<i<tt><Esc>

imap <leader>pre <pre><CR><CR></pre><Up>
vmap <leader>pre <Esc>`>a</pre><Esc>`<i<pre><Esc>

" links
imap <leader>aa <a href=""></a><C-O>F"
vmap <leader>aa <Esc>`>a</a><Esc>`<i<a href=""><Left><Left>

" paragraphs
imap <leader>pp <p></p><Esc>3hi
vmap <leader>pp <Esc>`>a</p><Esc>`<i<p><Esc>
imap <leader>br <br/>

" table, img, lists
imap <leader>tab <table><CR><tr><td></td><td></td></tr><CR></table><Esc>k02f>a
imap <leader>tr <tr><td></td></tr><Esc>9hi
vmap <leader>tr <Esc>`>a</td></tr><Esc>`<i<tr><td><Esc>
imap <leader>td <td></td><Esc>4hi
vmap <leader>td <Esc>`>a</td><Esc>`<i<td><Esc>
imap <leader>th <th></th><Esc>4hi
vmap <leader>th <Esc>`>a</td><Esc>`<i<td><Esc>

imap <leader>img <img src="" alt=""/><Esc>9hi

imap <leader>ul <ul><CR><li></li><CR></ul><Esc>ki
imap <leader>ol <ol><CR><li></li><CR></ol><Esc>ki
imap <leader>li <li></li><Esc>4hi
vmap <leader>li <Esc>`>a</li><Esc>`<i<li><Esc>

" magical close, stolen somewhere
imap <leader>. <Esc>F<yef>pa><Esc>F<a/<Left><Left>

imap <leader>html <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"<CR>"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><CR><html xmlns="http://www.w3.org/1999/xhtml"><CR><head><CR><title></title><CR><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><CR></head><CR><body><CR><CR></body><CR></html><Esc>2ki


" entitties (pun fully intended)
imap <leader>amp &amp;
imap <leader>ndash &ndash;
imap <leader>mdash &mdash;
imap <leader>lsq $lsquo;
imap <leader>rsq $rsquo;
imap <leader>lq $ldquo;
imap <leader>rq $rdquo;


"""""""""""""""""""""""""
" php stuff starts here:

imap <leader>doc /**<CR> *<CR>*/<Esc>k$
imap <leader>cla class <CR>{<CR>}<Esc>2k$i
imap <leader>puf public function ()<CR>{<CR>}<Esc>2k$hi
imap <leader>prf protected function ()<CR>{<CR>}<Esc>2k$hi
imap <leader>pus public static function ()<CR>{<CR>}<Esc>2k$hi
imap <leader>prs protected static function ()<CR>{<CR>}<Esc>2k$hi

imap <leader>if if () {<CR>}<Esc>k$2hi
imap <leader>whi while () {<CR>}<Esc>k$2hi
imap <leader>for for () {<CR>}<Esc>k$2hi
imap <leader>fea foreach () {<CR>}<Esc>k$2hi
imap <leader>swi switch () {<CR>}<Esc>k$2hi

"imap " ""<Esc>i
"imap ( ()<Esc>i

let php_sql_query=1
let php_htmlInStrings=1
let php_folding=1
