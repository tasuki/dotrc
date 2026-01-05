hi clear
let g:colors_name = 'minisolar'
if has("nvim-0.10")
	source $VIMRUNTIME/colors/vim.lua
end

let s:red     = "#EE3344"
let s:orange  = "#CC6600"
let s:yellow  = "#AA8800"
let s:green   = "#889900"
let s:cyan    = "#22AA99"
let s:blue    = "#2288CC"
let s:violet  = "#7777DD"
let s:magenta = "#CC44BB"

if &background == "dark"
	let s:base0 = "#002222"
	let s:base1 = "#113333"
	let s:base2 = "#335555"
	let s:base3 = "#557777"
	let s:base4 = "#889988"
	let s:base5 = "#AAAA99"
	let s:base6 = "#CCCCBB"
	let s:base7 = "#EEEEDD"
	let s:base8 = "#FFFFEE"
else
	let s:base0 = "#FFFFEE"
	let s:base1 = "#EEEEDD"
	let s:base2 = "#CCCCBB"
	let s:base3 = "#AAAA99"
	let s:base4 = "#889988"
	let s:base5 = "#557777"
	let s:base6 = "#335555"
	let s:base7 = "#113333"
	let s:base8 = "#002222"
endif

function! s:h(group, fg, bg, attr)
	let l:f = a:fg != "" ? " guifg=".a:fg : ""
	let l:b = a:bg != "" ? " guibg=".a:bg : ""
	let l:a = a:attr != "" ? " cterm=".a:attr." gui=".a:attr : " cterm=NONE gui=NONE"
	let l:s = a:fg != "" ? " guisp=".a:fg : ""
	exe "hi! " . a:group . l:f . l:b . l:a . l:s
endfunction

" :h group-name
call s:h("Normal", s:base5, s:base0, "")
call s:h("Comment", s:base4, "", "")
call s:h("Constant", s:magenta, "", "")
call s:h("String", s:cyan, "", "")
call s:h("Identifier", s:blue, "", "")
call s:h("Statement", s:green, "", "")
call s:h("PreProc", s:orange, "", "")
call s:h("Type", s:yellow, "", "")
call s:h("Special", s:red, "", "")
call s:h("Underlined", s:base5, "", "")
call s:h("Ignore", s:base2, "", "")
call s:h("Error", s:base0, s:red, "")
call s:h("Todo", s:magenta, s:base0, "")
call s:h("Added", s:green, "", "")
call s:h("Changed", s:blue, "", "")
call s:h("Removed", s:red, "", "")

" :h highlight-groups
call s:h("ColorColumn", s:base0, s:orange, "")
call s:h("Conceal", s:base5, s:base3, "")
call s:h("Cursor", s:base0, s:base8, "")
hi! link lCursor Cursor
hi! link CursorIM Cursor
call s:h("CursorColumn", s:base5, s:base1, "")
hi! link CursorLine CursorColumn
call s:h("Directory", s:blue, "", "")
hi! link DiffAdd Added
hi! link DiffChange Changed
hi! link DiffDelete Removed
hi! link DiffDelete Removed
call s:h("DiffText", s:base0, s:red, "")
call s:h("EndOfBuffer", s:base4, "", "bold")
call s:h("ErrorMsg", s:base0, s:red, "")
call s:h("VertSplit", s:base5, s:base1, "")
call s:h("Folded", s:base8, s:base2, "")
hi! link FoldColumn Folded
hi! link SignColumn Folded
call s:h("LineNr", s:red, "", "")
call s:h("CursorLineNr", s:red, "", "underline")
hi! link CursorLineFold Folded
hi! link CursorLineSign Folded
call s:h("MatchParen", s:base0, s:base3, "bold")
call s:h("MessageWindow", s:red, "", "")
call s:h("ModeMsg", "", "", "bold")
call s:h("MoreMsg", s:green, "", "")
call s:h("NonText", s:cyan, "", "")
call s:h("Pmenu", s:base0, s:base5, "bold")
call s:h("PmenuSel", s:base6, s:base2, "bold")
call s:h("Question", s:green, "", "")
call s:h("QuickFixLine", s:yellow, "", "")
call s:h("Search", s:base0, s:yellow, "")
call s:h("CurSearch", s:base0, s:orange, "")
call s:h("IncSearch", s:base0, s:orange, "")
call s:h("SpecialKey", s:blue, "", "")
call s:h("SpellBad", s:red, s:base1, "underline")
call s:h("SpellCap", s:violet, s:base1, "underline")
call s:h("SpellLocal", s:cyan, s:base1, "underline")
call s:h("SpellRare", s:yellow, s:base1, "underline")
call s:h("StatusLine", s:base8, s:base1, "bold")
call s:h("StatusLineNC", s:base8, s:base1, "")
call s:h("TabLine", s:base8, s:base2, "bold")
hi! link TabLineFill TabLine
call s:h("TabLineSel", s:base1, s:base7, "bold")
call s:h("Title", s:base5, "", "bold")
call s:h("Visual", s:base0, s:base5, "")
call s:h("WarningMsg", s:orange, "", "")
call s:h("WildMenu", s:base0, s:base7, "")
