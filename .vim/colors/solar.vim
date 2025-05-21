" Solarized, brought down to something more manageable

if exists("syntax_on")
	syntax reset
endif
let g:colors_name="solar"

" The colors
if &background == "dark"
	let s:base03      = "#002b36"
	let s:base02      = "#073642"
	let s:base01      = "#37565e"
	let s:base00      = "#62797a"
	let s:base0       = "#8f9c98"
	let s:base1       = "#bec2b6"
	let s:base2       = "#eee8d5"
	let s:base3       = "#fdf6e3"
else
	let s:base03      = "#fdf6e3"
	let s:base02      = "#eee8d5"
	let s:base01      = "#bec2b6"
	let s:base00      = "#8f9c98"
	let s:base0       = "#62797a"
	let s:base1       = "#37565e"
	let s:base2       = "#073642"
	let s:base3       = "#002b36"
endif

let s:red         = "#dd2244"
let s:orange      = "#cc6600"
let s:yellow      = "#aa8800"
let s:green       = "#889900"
let s:cyan        = "#22aa99"
let s:blue        = "#2288cc"
let s:violet      = "#7777dd"
let s:magenta     = "#cc3399"

let s:back        = s:base03


" Expect formatting to work
let s:none        = "NONE"
let s:c           = ",undercurl"
let s:r           = ",reverse"
let s:s           = ",standout"
let s:b           = ",bold"
let s:u           = ",underline"
let s:i           = ",italic"


" Primitives
exe "let s:bg_none      = ' guibg=".s:none   ."'"
exe "let s:bg_back      = ' guibg=".s:back   ."'"
exe "let s:bg_base03    = ' guibg=".s:base03 ."'"
exe "let s:bg_base02    = ' guibg=".s:base02 ."'"
exe "let s:bg_base01    = ' guibg=".s:base01 ."'"
exe "let s:bg_base00    = ' guibg=".s:base00 ."'"
exe "let s:bg_base0     = ' guibg=".s:base0  ."'"
exe "let s:bg_base1     = ' guibg=".s:base1  ."'"
exe "let s:bg_base2     = ' guibg=".s:base2  ."'"
exe "let s:bg_base3     = ' guibg=".s:base3  ."'"
exe "let s:bg_green     = ' guibg=".s:green  ."'"
exe "let s:bg_yellow    = ' guibg=".s:yellow ."'"
exe "let s:bg_orange    = ' guibg=".s:orange ."'"
exe "let s:bg_red       = ' guibg=".s:red    ."'"
exe "let s:bg_magenta   = ' guibg=".s:magenta."'"
exe "let s:bg_violet    = ' guibg=".s:violet ."'"
exe "let s:bg_blue      = ' guibg=".s:blue   ."'"
exe "let s:bg_cyan      = ' guibg=".s:cyan   ."'"

exe "let s:fg_none      = ' guifg=".s:none   ."'"
exe "let s:fg_base03    = ' guifg=".s:base03 ."'"
exe "let s:fg_base02    = ' guifg=".s:base02 ."'"
exe "let s:fg_base01    = ' guifg=".s:base01 ."'"
exe "let s:fg_base00    = ' guifg=".s:base00 ."'"
exe "let s:fg_base0     = ' guifg=".s:base0  ."'"
exe "let s:fg_base1     = ' guifg=".s:base1  ."'"
exe "let s:fg_base2     = ' guifg=".s:base2  ."'"
exe "let s:fg_base3     = ' guifg=".s:base3  ."'"
exe "let s:fg_green     = ' guifg=".s:green  ."'"
exe "let s:fg_yellow    = ' guifg=".s:yellow ."'"
exe "let s:fg_orange    = ' guifg=".s:orange ."'"
exe "let s:fg_red       = ' guifg=".s:red    ."'"
exe "let s:fg_magenta   = ' guifg=".s:magenta."'"
exe "let s:fg_violet    = ' guifg=".s:violet ."'"
exe "let s:fg_blue      = ' guifg=".s:blue   ."'"
exe "let s:fg_cyan      = ' guifg=".s:cyan   ."'"

exe "let s:sp_none      = ' guisp=".s:none   ."'"
exe "let s:sp_base03    = ' guisp=".s:base03 ."'"
exe "let s:sp_base02    = ' guisp=".s:base02 ."'"
exe "let s:sp_base01    = ' guisp=".s:base01 ."'"
exe "let s:sp_base00    = ' guisp=".s:base00 ."'"
exe "let s:sp_base0     = ' guisp=".s:base0  ."'"
exe "let s:sp_base1     = ' guisp=".s:base1  ."'"
exe "let s:sp_base2     = ' guisp=".s:base2  ."'"
exe "let s:sp_base3     = ' guisp=".s:base3  ."'"
exe "let s:sp_green     = ' guisp=".s:green  ."'"
exe "let s:sp_yellow    = ' guisp=".s:yellow ."'"
exe "let s:sp_orange    = ' guisp=".s:orange ."'"
exe "let s:sp_red       = ' guisp=".s:red    ."'"
exe "let s:sp_magenta   = ' guisp=".s:magenta."'"
exe "let s:sp_violet    = ' guisp=".s:violet ."'"
exe "let s:sp_blue      = ' guisp=".s:blue   ."'"
exe "let s:sp_cyan      = ' guisp=".s:cyan   ."'"

exe "let s:fmt_none     = ' gui=NONE"        ."'"
exe "let s:fmt_bold     = ' gui=NONE".s:b    ."'"
exe "let s:fmt_bldi     = ' gui=NONE".s:b    ."'"
exe "let s:fmt_undr     = ' gui=NONE".s:u    ."'"
exe "let s:fmt_undb     = ' gui=NONE".s:u.s:b."'"
exe "let s:fmt_undi     = ' gui=NONE".s:u.s:i."'"
exe "let s:fmt_curl     = ' gui=NONE".s:c    ."'"
exe "let s:fmt_ital     = ' gui=NONE".s:i    ."'"
exe "let s:fmt_stnd     = ' gui=NONE".s:s    ."'"
exe "let s:fmt_revr     = ' gui=NONE".s:r    ."'"
exe "let s:fmt_revb     = ' gui=NONE".s:r.s:b."'"

" Basic highlighting
" :h group-name  :h highlight-groups
" Normal with bg_none breaks in older tmuxes
" Normal with bg_back breaks in gvim, choose
" exe "hi! Normal"         .s:fmt_none   .s:fg_base0  .s:bg_none
exe "hi! Normal"         .s:fmt_none   .s:fg_base0  .s:bg_back
exe "hi! Comment"        .s:fmt_none   .s:fg_base00 .s:bg_none
exe "hi! Constant"       .s:fmt_none   .s:fg_magenta.s:bg_none
exe "hi! String"         .s:fmt_none   .s:fg_cyan   .s:bg_none
exe "hi! Identifier"     .s:fmt_none   .s:fg_violet .s:bg_none
exe "hi! Function"       .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! Statement"      .s:fmt_none   .s:fg_green  .s:bg_none
hi! link Operator Statement
exe "hi! PreProc"        .s:fmt_none   .s:fg_orange .s:bg_none
exe "hi! Type"           .s:fmt_none   .s:fg_yellow .s:bg_none
exe "hi! Special"        .s:fmt_none   .s:fg_red    .s:bg_none
exe "hi! Delimiter"      .s:fmt_none   .s:fg_base2  .s:bg_none
exe "hi! Underlined"     .s:fmt_undr   .s:fg_base0  .s:bg_none
exe "hi! Ignore"         .s:fmt_none   .s:fg_none   .s:bg_none
exe "hi! Error"          .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! Todo"           .s:fmt_bold   .s:fg_magenta.s:bg_none

" Extended highlighting
exe "hi! SpecialKey"     .s:fmt_bold   .s:fg_base00 .s:bg_base02
exe "hi! NonText"        .s:fmt_bold   .s:fg_base00 .s:bg_none
exe "hi! StatusLine"     .s:fmt_bold   .s:fg_base3  .s:bg_base02
exe "hi! StatusLineNC"   .s:fmt_none   .s:fg_base1  .s:bg_base02
exe "hi! Visual"         .s:fmt_none   .s:fg_base03 .s:bg_base00
exe "hi! Directory"      .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ErrorMsg"       .s:fmt_revr   .s:fg_red    .s:bg_none
exe "hi! CurSearch"      .s:fmt_stnd   .s:fg_orange .s:bg_none
exe "hi! IncSearch"      .s:fmt_stnd   .s:fg_orange .s:bg_none
exe "hi! Search"         .s:fmt_revr   .s:fg_yellow .s:bg_none
exe "hi! MoreMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ModeMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! LineNr"         .s:fmt_none   .s:fg_base01 .s:bg_base02
exe "hi! Question"       .s:fmt_bold   .s:fg_cyan   .s:bg_none
exe "hi! QuickFixLine"   .s:fmt_bold   .s:fg_base0  .s:bg_none
exe "hi! VertSplit"      .s:fmt_revb   .s:fg_base02 .s:bg_base00
exe "hi! WinSeparator"   .s:fmt_none   .s:fg_base01 .s:bg_base03
exe "hi! Title"          .s:fmt_bold   .s:fg_base00 .s:bg_none
exe "hi! VisualNOS"      .s:fmt_stnd   .s:fg_none   .s:bg_base02 .s:fmt_revb
exe "hi! WarningMsg"     .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! WildMenu"       .s:fmt_none   .s:fg_base2  .s:bg_base02 .s:fmt_revb
exe "hi! Folded"         .s:fmt_undb   .s:fg_base0  .s:bg_base02 .s:sp_base03
exe "hi! FoldColumn"     .s:fmt_none   .s:fg_base0  .s:bg_base02
exe "hi! DiffAdd"        .s:fmt_bold   .s:fg_green  .s:bg_base02 .s:sp_green
exe "hi! DiffChange"     .s:fmt_bold   .s:fg_yellow .s:bg_base02 .s:sp_yellow
exe "hi! DiffDelete"     .s:fmt_bold   .s:fg_red    .s:bg_base02
hi! link Added DiffAdd
hi! link Changed DiffChange
hi! link Deleted DiffDelete
hi! link Removed DiffDelete
exe "hi! DiffText"       .s:fmt_bold   .s:fg_blue   .s:bg_base02 .s:sp_blue
exe "hi! SignColumn"     .s:fmt_none   .s:fg_base0
exe "hi! Conceal"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! SpellBad"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_red
exe "hi! SpellCap"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_violet
exe "hi! SpellRare"      .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
exe "hi! SpellLocal"     .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_yellow
exe "hi! Pmenu"          .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:fmt_revb
exe "hi! PmenuSel"       .s:fmt_none   .s:fg_base01 .s:bg_base2   .s:fmt_revb
exe "hi! PmenuSbar"      .s:fmt_none   .s:fg_base2  .s:bg_base0   .s:fmt_revb
exe "hi! PmenuThumb"     .s:fmt_none   .s:fg_base0  .s:bg_base03  .s:fmt_revb
exe "hi! TabLine"        .s:fmt_bold   .s:fg_base2  .s:bg_base02
exe "hi! TabLineFill"    .s:fmt_bold   .s:fg_base2  .s:bg_base02
exe "hi! TabLineSel"     .s:fmt_bold   .s:fg_base02 .s:bg_base2
exe "hi! CursorColumn"   .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! CursorLine"     .s:fmt_none   .s:fg_none   .s:bg_base02  .s:sp_base1
exe "hi! ColorColumn"    .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! Cursor"         .s:fmt_none   .s:fg_base03 .s:bg_base0
hi! link lCursor Cursor
exe "hi! MatchParen"     .s:fmt_bold   .s:fg_red    .s:bg_base01
exe "hi! NormalFloat"    .s:fmt_ital   .s:fg_base1  .s:bg_base02
exe "hi! WinBar"         .s:fmt_bold   .s:fg_base2  .s:bg_base02
exe "hi! WinBarNC"       .s:fmt_none   .s:fg_base2  .s:bg_base02

" :h diagnostic-highlights
exe "hi! DiagnosticError"   .s:fmt_ital   .s:fg_red    .s:bg_none
exe "hi! DiagnosticWarn"    .s:fmt_ital   .s:fg_orange .s:bg_none
exe "hi! DiagnosticInfo"    .s:fmt_ital   .s:fg_yellow .s:bg_none
exe "hi! DiagnosticHint"    .s:fmt_ital   .s:fg_base0  .s:bg_none
exe "hi! DiagnosticOk"      .s:fmt_ital   .s:fg_green  .s:bg_none

exe "hi! DiagnosticUnderlineError"   .s:fmt_undi   .s:fg_red    .s:bg_none
exe "hi! DiagnosticUnderlineWarn"    .s:fmt_undi   .s:fg_orange .s:bg_none
exe "hi! DiagnosticUnderlineInfo"    .s:fmt_undi   .s:fg_yellow .s:bg_none
exe "hi! DiagnosticUnderlineHint"    .s:fmt_undi   .s:fg_base0  .s:bg_none
exe "hi! DiagnosticUnderlineOk"      .s:fmt_undi   .s:fg_green  .s:bg_none

if has("nvim-0.10")
	" :h treesitter-highlight-groups
	hi! link @variable Identifier
	exe "hi! @comment.error"    .s:fmt_bold   .s:fg_red    .s:bg_none
	exe "hi! @comment.warning"  .s:fmt_bold   .s:fg_orange .s:bg_none
	exe "hi! @comment.note"     .s:fmt_bold   .s:fg_green  .s:bg_none
	exe "hi! @markup.heading.1" .s:fmt_bold   .s:fg_orange .s:bg_none
	exe "hi! @markup.heading.2" .s:fmt_bold   .s:fg_yellow .s:bg_none
	exe "hi! @markup.quote"     .s:fmt_none   .s:fg_green  .s:bg_none
	exe "hi! @markup.raw"       .s:fmt_none   .s:fg_green  .s:bg_none
	exe "hi! @markup.raw.block" .s:fmt_none   .s:fg_green  .s:bg_none
	exe "hi! @markup.link"      .s:fmt_undr   .s:fg_blue   .s:bg_none
	exe "hi! @tag"              .s:fmt_none   .s:fg_blue   .s:bg_none
	exe "hi! @tag.builtin"      .s:fmt_none   .s:fg_blue   .s:bg_none
	exe "hi! @tag.attribute"    .s:fmt_none   .s:fg_yellow .s:bg_none
	exe "hi! @tag.delimiter"    .s:fmt_none   .s:fg_base01 .s:bg_none
endif


" Language support for legacy vim

" HTML
exe "hi! htmlTag"            .s:fmt_none .s:fg_base01 .s:bg_none
exe "hi! htmlEndTag"         .s:fmt_none .s:fg_base01 .s:bg_none
exe "hi! htmlTagName"        .s:fmt_none .s:fg_blue   .s:bg_none
exe "hi! HtmlH1"             .s:fmt_bold .s:fg_orange .s:bg_none
exe "hi! HtmlH2"             .s:fmt_bold .s:fg_yellow .s:bg_none
exe "hi! HtmlH3"             .s:fmt_bold .s:fg_base00 .s:bg_none

" Markdown
exe "hi! markdownLinkText"   .s:fmt_none .s:fg_blue   .s:bg_none
exe "hi! markdownUrl"        .s:fmt_none .s:fg_violet .s:bg_none
exe "hi! markdownListMarker" .s:fmt_none .s:fg_magenta.s:bg_none
exe "hi! markdownCode"       .s:fmt_none .s:fg_green  .s:bg_none

" Vimwiki
hi! link VimwikiHeader1  HtmlH1
hi! link VimwikiHeader2  HtmlH2
hi! link VimwikiLink     markdownLinkText
hi! link VimwikiList     markdownListMarker
hi! link VimwikiCode     markdownCode
hi! link VimwikiPre      markdownCode
