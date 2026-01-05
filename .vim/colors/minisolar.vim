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
	let s:base03 = "#002222"
	let s:base02 = "#113333"
	let s:base01 = "#335555"
	let s:base00 = "#557777"
	let s:base0  = "#AAAA99"
	let s:base1  = "#CCCCBB"
	let s:base2  = "#EEEEDD"
	let s:base3  = "#FFFFEE"
else
	let s:base03 = "#FFFFEE"
	let s:base02 = "#EEEEDD"
	let s:base01 = "#CCCCBB"
	let s:base00 = "#AAAA99"
	let s:base0  = "#557777"
	let s:base1  = "#335555"
	let s:base2  = "#113333"
	let s:base3  = "#002222"
endif

function! s:h(group, fg, bg)
	let l:f = a:fg != "" ? " guifg=".a:fg : ""
	let l:b = a:bg != "" ? " guibg=".a:bg : ""
	exe "hi! " . a:group . l:f . l:b
endfunction

call s:h("Normal", s:base0, s:base03)
call s:h("Comment", s:base00, "")
call s:h("Constant", s:magenta, "")
call s:h("String", s:cyan, "")
call s:h("Identifier", s:blue, "")
call s:h("Statement", s:green, "")
call s:h("PreProc", s:orange, "")
call s:h("Type", s:yellow, "")
call s:h("Special", s:red, "")
call s:h("Underlined", s:base0, "")
call s:h("Ignore", s:base01, "")
call s:h("Error", s:base03, s:red)
call s:h("Todo", s:magenta, s:base03)
call s:h("Added", s:green, "")
call s:h("Changed", s:blue, "")
call s:h("Removed", s:red, "")
