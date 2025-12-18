" Solarized, brought down to something more manageable

hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="solar"

" The colors
if &background == "dark"
	let s:base03 = "#002b36"
	let s:base02 = "#073642"
	let s:base01 = "#37565e"
	let s:base00 = "#62797a"
	let s:base0  = "#8f9c98"
	let s:base1  = "#bec2b6"
	let s:base2  = "#eee8d5"
	let s:base3  = "#fdf6e3"
else
	let s:base03 = "#fdf6e3"
	let s:base02 = "#eee8d5"
	let s:base01 = "#bec2b6"
	let s:base00 = "#8f9c98"
	let s:base0  = "#62797a"
	let s:base1  = "#37565e"
	let s:base2  = "#073642"
	let s:base3  = "#002b36"
endif

let s:red     = "#dd2244"
let s:orange  = "#cc6600"
let s:yellow  = "#aa8800"
let s:green   = "#889900"
let s:cyan    = "#22aa99"
let s:blue    = "#2288cc"
let s:violet  = "#7777dd"
let s:magenta = "#cc3399"

" Highlight Helper
function! s:h(group, fg, bg, attr, sp)
	let l:f = a:fg != "" ? " guifg=".a:fg : ""
	let l:b = a:bg != "" ? " guibg=".a:bg : ""
	let l:a = a:attr != "" ? " gui=".a:attr : " gui=NONE"
	let l:s = a:sp != "" ? " guisp=".a:sp : ""
	exe "hi! " . a:group . l:f . l:b . l:a . l:s
endfunction

" Basic highlighting
" :h group-name  :h highlight-groups
" Normal with bg none breaks in older tmuxes
" Normal with bg base03 breaks in gvim, choose
call s:h("Normal", s:base0, s:base03, "", "")
call s:h("Comment", s:base00, "", "", "")
call s:h("Constant", s:magenta, "", "", "")
call s:h("String", s:cyan, "", "", "")
call s:h("Identifier", s:violet, "", "", "")
call s:h("Function", s:blue, "", "", "")
call s:h("Statement", s:green, "", "", "")
hi! link Operator Statement
call s:h("PreProc", s:orange, "", "", "")
call s:h("Type", s:yellow, "", "", "")
call s:h("Special", s:red, "", "", "")
call s:h("Delimiter", s:base2, "", "", "")
call s:h("Underlined", s:base0, "", "underline", "")
call s:h("Ignore", "", "", "", "")
call s:h("Error", s:red, "", "bold", "")
call s:h("Todo", s:magenta, "", "bold", "")
call s:h("Added", s:green, s:base02, "bold", s:green)
call s:h("Changed", s:yellow, s:base02, "bold", s:yellow)
call s:h("Removed", s:red, s:base02, "bold", s:red)

" Extended highlighting
call s:h("SpecialKey", s:base00, s:base02, "bold", "")
call s:h("NonText", s:base00, "", "bold", "")
call s:h("StatusLine", s:base3, s:base02, "bold", "")
call s:h("StatusLineNC", s:base1, s:base02, "", "")
call s:h("Visual", s:base03, s:base00, "", "")
call s:h("Directory", s:blue, "", "", "")
call s:h("ErrorMsg", "", s:red, "", "")
call s:h("CurSearch", s:base02, s:orange, "", "")
call s:h("IncSearch", s:base02, s:orange, "", "")
call s:h("Search", s:base02, s:yellow, "", "")
call s:h("MoreMsg", s:blue, "", "", "")
call s:h("ModeMsg", s:blue, "", "", "")
call s:h("LineNr", s:base01, s:base02, "", "")
call s:h("Question", s:cyan, "", "bold", "")
call s:h("QuickFixLine", s:base0, "", "bold", "")
call s:h("VertSplit", s:base00, s:base02, "bold", "")
call s:h("WinSeparator", s:base01, s:base03, "", "")
call s:h("Title", s:base00, "", "bold", "")
call s:h("VisualNOS", s:base02, "", "bold", "")
call s:h("WarningMsg", s:red, "", "bold", "")
call s:h("WildMenu", s:base02, s:base2, "bold", "")
call s:h("Folded", s:base0, s:base02, "bold,underline", s:base03)
call s:h("FoldColumn", s:base0, s:base02, "", "")
hi! link DiffAdd Added
hi! link DiffChange Changed
hi! link DiffDelete Removed
call s:h("DiffText", s:blue, s:base02, "bold", s:blue)
call s:h("SignColumn", s:base0, "", "", "")
call s:h("Conceal", s:blue, "", "", "")
call s:h("SpellBad", "", "", "undercurl", s:red)
call s:h("SpellCap", "", "", "undercurl", s:violet)
call s:h("SpellRare", "", "", "undercurl", s:cyan)
call s:h("SpellLocal", "", "", "undercurl", s:yellow)
call s:h("Pmenu", s:base02, s:base0, "bold", "")
call s:h("PmenuSel", s:base2, s:base01, "bold", "")
call s:h("PmenuSbar", s:base0, s:base2, "bold", "")
call s:h("PmenuThumb", s:base03, s:base0, "bold", "")
call s:h("TabLine", s:base2, s:base02, "bold", "")
hi! link TabLineFill TabLine
call s:h("TabLineSel", s:base02, s:base2, "bold", "")
call s:h("CursorColumn", "", s:base02, "", "")
call s:h("CursorLine", "", s:base02, "", s:base1)
call s:h("ColorColumn", "", s:base02, "", "")
call s:h("Cursor", s:base03, s:base0, "", "")
hi! link lCursor Cursor
call s:h("MatchParen", s:red, s:base01, "bold", "")
call s:h("NormalFloat", s:base1, s:base02, "italic", "")
call s:h("WinBar", s:base2, s:base02, "bold", "")
call s:h("WinBarNC", s:base2, s:base02, "", "")

" :h diagnostic-highlights
call s:h("DiagnosticError", s:red, "", "italic", "")
call s:h("DiagnosticWarn", s:orange, "", "italic", "")
call s:h("DiagnosticInfo", s:yellow, "", "italic", "")
call s:h("DiagnosticHint", s:base0, "", "italic", "")
call s:h("DiagnosticOk", s:green, "", "italic", "")
call s:h("DiagnosticUnderlineError", s:red, "", "underline,italic", "")
call s:h("DiagnosticUnderlineWarn", s:orange, "", "underline,italic", "")
call s:h("DiagnosticUnderlineInfo", s:yellow, "", "underline,italic", "")
call s:h("DiagnosticUnderlineHint", s:base0, "", "underline,italic", "")
call s:h("DiagnosticUnderlineOk", s:green, "", "underline,italic", "")

if has("nvim-0.10")
	" :h treesitter-highlight-groups
	hi! link @variable Identifier
	call s:h("@comment.error", s:red, "", "bold", "")
	call s:h("@comment.warning", s:orange, "", "bold", "")
	call s:h("@comment.note", s:green, "", "bold", "")
	call s:h("@markup.heading.1", s:orange, "", "bold", "")
	call s:h("@markup.heading.2", s:yellow, "", "bold", "")
	call s:h("@markup.quote", s:green, "", "", "")
	call s:h("@markup.raw", s:green, "", "", "")
	call s:h("@markup.list", s:magenta, "", "", "")
	call s:h("@markup.link", s:blue, "", "", "")
	call s:h("@markup.link.url", s:violet, "", "", "")
	call s:h("@tag", s:blue, "", "", "")
	call s:h("@tag.builtin", s:blue, "", "", "")
	call s:h("@tag.attribute", s:yellow, "", "", "")
	call s:h("@tag.delimiter", s:base01, "", "", "")
endif

" Windsurf
call s:h("CodeiumSuggestion", s:base00, "", "italic", "")


" Language support for legacy vim

" HTML
call s:h("htmlTag", s:base01, "", "", "")
call s:h("htmlEndTag", s:base01, "", "", "")
hi! link htmlEndTag htmlTag
call s:h("htmlTagName", s:blue, "", "", "")
call s:h("HtmlH1", s:orange, "", "bold", "")
call s:h("HtmlH2", s:yellow, "", "bold", "")
call s:h("HtmlH3", s:base00, "", "bold", "")

" Markdown
call s:h("markdownLinkText", s:blue, "", "", "")
call s:h("markdownUrl", s:violet, "", "", "")
call s:h("markdownListMarker", s:magenta, "", "", "")
call s:h("markdownCode", s:green, "", "", "")

" Vimwiki
hi! link VimwikiHeader1  HtmlH1
hi! link VimwikiHeader2  HtmlH2
hi! link VimwikiLink     markdownLinkText
hi! link VimwikiList     markdownListMarker
hi! link VimwikiCode     markdownCode
hi! link VimwikiPre      markdownCode
