" Solarized, brought down to something more manageable

hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="solar"

" The colors
if &background == "dark"
	let s:base0 = "#002A31"
	let s:base1 = "#0D3A3C"
	let s:base2 = "#375B53"
	let s:base3 = "#617C6D"
	let s:base4 = "#8D9E8A"
	let s:base5 = "#BBC1AB"
	let s:base6 = "#D2D3BE"
	let s:base7 = "#E8E5D1"
	let s:base8 = "#FFF8E6"

	let s:red     = "#FC4257"
	let s:orange  = "#EC7C0E"
	let s:yellow  = "#C7A01E"
	let s:green   = "#98B224"
	let s:cyan    = "#21BFA0"
	let s:blue    = "#249FF3"
	let s:violet  = "#8082F7"
	let s:magenta = "#DD56B8"

	let s:bg_red     = "#542526"
	let s:bg_orange  = "#4D2C15"
	let s:bg_yellow  = "#3F3414"
	let s:bg_green   = "#3A460B"
	let s:bg_cyan    = "#044E40"
	let s:bg_blue    = "#05436C"
	let s:bg_violet  = "#2F3058"
	let s:bg_magenta = "#4D2641"

	let s:bg_hi_red     = "#742D31"
	let s:bg_hi_orange  = "#6C380D"
	let s:bg_hi_yellow  = "#584503"
	let s:bg_hi_green   = "#4B5A00"
	let s:bg_hi_cyan    = "#006752"
	let s:bg_hi_blue    = "#00568F"
	let s:bg_hi_violet  = "#3E3F7C"
	let s:bg_hi_magenta = "#6A2F58"

else
	let s:base0 = "#FFF8E6"
	let s:base1 = "#E8E5D1"
	let s:base2 = "#D2D3BE"
	let s:base3 = "#BBC1AB"
	let s:base4 = "#8D9E8A"
	let s:base5 = "#617C6D"
	let s:base6 = "#375B53"
	let s:base7 = "#0D3A3C"
	let s:base8 = "#002A31"

	let s:red     = "#DE1D3F"
	let s:orange  = "#C9690C"
	let s:yellow  = "#AB8704"
	let s:green   = "#819808"
	let s:cyan    = "#05A388"
	let s:blue    = "#1F86CD"
	let s:violet  = "#6A69DB"
	let s:magenta = "#C13B9F"

	let s:bg_red     = "#FFE4E3"
	let s:bg_orange  = "#FFE5D2"
	let s:bg_yellow  = "#FEEEC1"
	let s:bg_green   = "#E7F7BB"
	let s:bg_cyan    = "#C5FCEC"
	let s:bg_blue    = "#DBEEFF"
	let s:bg_violet  = "#E7EAFF"
	let s:bg_magenta = "#FFE1F4"

	let s:bg_hi_red     = "#FAC5C4"
	let s:bg_hi_orange  = "#F9C9A9"
	let s:bg_hi_yellow  = "#EED692"
	let s:bg_hi_green   = "#CEE38F"
	let s:bg_hi_cyan    = "#95EBD4"
	let s:bg_hi_blue    = "#B4D9FA"
	let s:bg_hi_violet  = "#CCD1FC"
	let s:bg_hi_magenta = "#F5C3E3"
endif


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
call s:h("Normal", s:base5, s:base0, "", "")
call s:h("Comment", s:base4, "", "", "")
call s:h("Constant", s:magenta, "", "", "")
call s:h("String", s:cyan, "", "", "")
call s:h("Identifier", s:violet, "", "", "")
call s:h("Function", s:blue, "", "", "")
call s:h("Statement", s:green, "", "", "")
hi! link Operator Statement
call s:h("PreProc", s:orange, "", "", "")
call s:h("Type", s:yellow, "", "", "")
call s:h("Special", s:red, "", "", "")
call s:h("Delimiter", s:base7, "", "", "")
call s:h("Underlined", s:base5, "", "underline", "")
call s:h("Ignore", s:base3, "", "", "")
call s:h("Error", s:base0, s:red, "", "")
call s:h("Todo", s:magenta, "", "bold", "")
call s:h("Added", s:green, s:bg_green, "", "")
call s:h("Changed", s:yellow, s:bg_yellow, "", "")
call s:h("Removed", s:red, s:bg_red, "", "")

" Extended highlighting
call s:h("SpecialKey", s:base4, s:base1, "bold", "")
call s:h("NonText", s:base4, "", "bold", "")
call s:h("StatusLine", s:base8, s:base1, "bold", "")
call s:h("StatusLineNC", s:base6, s:base1, "", "")
call s:h("Visual", s:base0, s:base4, "", "")
call s:h("Directory", s:blue, "", "", "")
call s:h("ErrorMsg", s:base0, s:red, "", "")
call s:h("CurSearch", s:base1, s:orange, "", "")
call s:h("IncSearch", s:base1, s:orange, "", "")
call s:h("Search", s:base1, s:yellow, "", "")
call s:h("MoreMsg", s:blue, "", "", "")
call s:h("ModeMsg", s:blue, "", "", "")
call s:h("LineNr", s:base3, s:base1, "", "")
call s:h("Question", s:cyan, "", "bold", "")
call s:h("QuickFixLine", s:base5, "", "bold", "")
call s:h("VertSplit", s:base4, s:base1, "bold", "")
call s:h("WinSeparator", s:base3, s:base0, "", "")
call s:h("Title", s:base4, "", "bold", "")
call s:h("VisualNOS", s:base1, "", "bold", "")
call s:h("WarningMsg", s:red, "", "bold", "")
call s:h("WhiteSpace", s:base2, "", "", "")
call s:h("WildMenu", s:base1, s:base7, "bold", "")
call s:h("Folded", s:base5, s:base1, "bold,underline", s:base0)
call s:h("FoldColumn", s:base5, s:base1, "", "")
hi! link DiffAdd Added
hi! link DiffChange Changed
hi! link DiffDelete Removed
call s:h("DiffText", s:blue, s:base1, "bold", s:blue)
call s:h("SignColumn", s:base5, "", "", "")
call s:h("Conceal", s:blue, "", "", "")
call s:h("SpellBad", "", "", "undercurl", s:red)
call s:h("SpellCap", "", "", "undercurl", s:violet)
call s:h("SpellRare", "", "", "undercurl", s:cyan)
call s:h("SpellLocal", "", "", "undercurl", s:yellow)
call s:h("Pmenu", s:base1, s:base5, "bold", "")
call s:h("PmenuSel", s:base7, s:base3, "bold", "")
call s:h("PmenuSbar", s:base5, s:base7, "bold", "")
call s:h("PmenuThumb", s:base0, s:base5, "bold", "")
call s:h("TabLine", s:base7, s:base1, "bold", "")
hi! link TabLineFill TabLine
call s:h("TabLineSel", s:base1, s:base7, "bold", "")
call s:h("CursorColumn", "", s:base1, "", "")
call s:h("CursorLine", "", s:base1, "", s:base6)
call s:h("ColorColumn", "", s:base1, "", "")
call s:h("Cursor", s:base0, s:base5, "", "")
hi! link lCursor Cursor
call s:h("MatchParen", s:red, s:base3, "bold", "")
call s:h("NormalFloat", s:base6, s:base1, "italic", "")
call s:h("WinBar", s:base7, s:base1, "bold", "")
call s:h("WinBarNC", s:base7, s:base1, "", "")

" :h diagnostic-highlights
call s:h("DiagnosticError", s:red, "", "italic", "")
call s:h("DiagnosticWarn", s:orange, "", "italic", "")
call s:h("DiagnosticInfo", s:cyan, "", "italic", "")
call s:h("DiagnosticHint", s:blue, "", "italic", "")
call s:h("DiagnosticOk", s:green, "", "italic", "")

call s:h("DiagnosticUnderlineError", s:red, "", "underline,italic", s:red)
call s:h("DiagnosticUnderlineWarn", s:orange, "", "underline,italic", s:orange)
call s:h("DiagnosticUnderlineInfo", s:cyan, "", "underline,italic", s:cyan)
call s:h("DiagnosticUnderlineHint", s:blue, "", "underline,italic", s:blue)
call s:h("DiagnosticUnderlineOk", s:green, "", "underline,italic", s:green)

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
	call s:h("@tag.delimiter", s:base3, "", "", "")
endif

" Windsurf
call s:h("CodeiumSuggestion", s:base4, "", "italic", "")


" Language support for legacy vim

" HTML
call s:h("htmlTag", s:base3, "", "", "")
call s:h("htmlEndTag", s:base3, "", "", "")
hi! link htmlEndTag htmlTag
call s:h("htmlTagName", s:blue, "", "", "")
call s:h("HtmlH1", s:orange, "", "bold", "")
call s:h("HtmlH2", s:yellow, "", "bold", "")
call s:h("HtmlH3", s:base3, "", "bold", "")

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
