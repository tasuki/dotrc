" plugin loading and settings with vim-plug
" to set up, run: `dotrc/install/vim.sh`

call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/sideways.vim', { 'tag': 'v0.4.0' }
Plug 'easymotion/vim-easymotion', { 'tag': 'v3.0.1' }
Plug 'editorconfig/editorconfig-vim', { 'tag': 'v1.2.0' }
Plug 'garbas/vim-snipmate', { 'commit': 'f5a75d0' } " the old one with no deps
Plug 'junegunn/fzf.vim', { 'commit': '87b60bb' }
Plug 'kien/rainbow_parentheses.vim', { 'commit': 'eb8baa5' }
Plug 'preservim/nerdtree', { 'tag': '7.1.2' }
Plug 'tpope/vim-fugitive', { 'tag': 'v3.7' }
Plug 'tpope/vim-surround', { 'tag': 'v2.2' }
Plug 'vimwiki/vimwiki', { 'tag': 'v2.5' }
call plug#end()

delc PlugUpgrade	" don't accidentally upgrade vim-plug

" easymotion
hi link EasyMotionTarget PreProc
hi link EasyMotionShade Comment

let g:EasyMotion_mapping_f = '<Leader>j'
let g:EasyMotion_mapping_F = '<Leader>k'

" editorconfig: exclude fzf
let g:EditorConfig_exclude_patterns = ['term://.*']

" FZF

if filereadable("/usr/share/doc/fzf/examples/plugin/fzf.vim")
	source /usr/share/doc/fzf/examples/plugin/fzf.vim
endif

" git grep
command! -bang -nargs=* GG
	\ call fzf#vim#grep2(
	\ 'git grep --ignore-case --line-number -- ',
	\ <q-args>, 0, fzf#vim#with_preview(), <bang>0)

" rip grep
command! -bang -nargs=* RG
	\ call fzf#vim#grep2(
	\ "rg --column --line-number --no-heading --color=always --hidden --smart-case -- ",
	\ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

nmap <Leader><Enter> :GFiles<CR>
nmap <Leader>. :Files<CR>
nmap <Leader>r :RG<CR>
nmap <Leader>g :GG<CR>
nmap <Leader>/ :execute ':RG ' . expand('<cword>')<CR>

" nerdtree
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>
let g:NERDTreeChDirMode = 2

" Fugitive
autocmd QuickFixCmdPost *grep* cwindow
map <Leader>b :Git blame<CR>

" Rainbows
"
" yellow, red, magenta, violet, blue, cyan, green
" :help cterm-colors, see the NR-8 column, add 8 for light
let g:rbpt_colorpairs = [
    \ [ 3, '#b58900'],
    \ [ 9, '#cb4b16'],
    \ [ 5, '#d33682'],
    \ [13, '#6c71c4'],
    \ [ 4, '#268bd2'],
    \ [ 6, '#2aa198'],
    \ [ 2, '#859900'],
    \ ]

" turn off rainbows for vimwiki and markdown
function! HasRainbows()
    return &ft != "vimwiki" && &ft != "markdown"
endfunction
au VimEnter * if HasRainbows() | RainbowParenthesesToggleAll
au Syntax   * if HasRainbows() | RainbowParenthesesLoadRound
au Syntax   * if HasRainbows() | RainbowParenthesesLoadSquare
au Syntax   * if HasRainbows() | RainbowParenthesesLoadBraces

" Sideways
nnoremap <Leader>h :SidewaysLeft<cr>
nnoremap <Leader>l :SidewaysRight<cr>

" snipmate
let g:snippets_dir = '~/.vim/snippets/'

" vimwiki
let g:vimwiki_global_ext = 0 " don't hijack all markdown
let g:vimwiki_list = [{'path': '~/data/prog/vitwiki', 'syntax': 'markdown', 'ext': '.md'}]
