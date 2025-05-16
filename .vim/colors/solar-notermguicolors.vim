" Solarized, brought down to something more manageable

set notermguicolors
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="solar-notermguicolors"

" The colors
let s:base3       = 15
let s:base2       = 7
let s:base1       = 14
let s:base0       = 12
let s:base00      = 11
let s:base01      = 10
let s:base02      = 8
let s:base03      = 0

let s:red         = 1
let s:orange      = 9
let s:yellow      = 3
let s:green       = 2
let s:cyan        = 6
let s:blue        = 4
let s:violet      = 13
let s:magenta     = 5

let s:back        = s:base03


" Expect formatting to work
let s:none        = "NONE"
let s:c           = "undercurl"
let s:r           = "reverse"
let s:s           = "standout"
let s:b           = "bold"
let s:u           = "underline"
let s:i           = "italic"


" Primitives
exe "let s:bg_none      = ' ctermbg=".s:none   ."'"
exe "let s:bg_back      = ' ctermbg=".s:back   ."'"
exe "let s:bg_base03    = ' ctermbg=".s:base03 ."'"
exe "let s:bg_base02    = ' ctermbg=".s:base02 ."'"
exe "let s:bg_base01    = ' ctermbg=".s:base01 ."'"
exe "let s:bg_base00    = ' ctermbg=".s:base00 ."'"
exe "let s:bg_base0     = ' ctermbg=".s:base0  ."'"
exe "let s:bg_base1     = ' ctermbg=".s:base1  ."'"
exe "let s:bg_base2     = ' ctermbg=".s:base2  ."'"
exe "let s:bg_base3     = ' ctermbg=".s:base3  ."'"
exe "let s:bg_green     = ' ctermbg=".s:green  ."'"
exe "let s:bg_yellow    = ' ctermbg=".s:yellow ."'"
exe "let s:bg_orange    = ' ctermbg=".s:orange ."'"
exe "let s:bg_red       = ' ctermbg=".s:red    ."'"
exe "let s:bg_magenta   = ' ctermbg=".s:magenta."'"
exe "let s:bg_violet    = ' ctermbg=".s:violet ."'"
exe "let s:bg_blue      = ' ctermbg=".s:blue   ."'"
exe "let s:bg_cyan      = ' ctermbg=".s:cyan   ."'"

exe "let s:fg_none      = ' ctermfg=".s:none   ."'"
exe "let s:fg_base03    = ' ctermfg=".s:base03 ."'"
exe "let s:fg_base02    = ' ctermfg=".s:base02 ."'"
exe "let s:fg_base01    = ' ctermfg=".s:base01 ."'"
exe "let s:fg_base00    = ' ctermfg=".s:base00 ."'"
exe "let s:fg_base0     = ' ctermfg=".s:base0  ."'"
exe "let s:fg_base1     = ' ctermfg=".s:base1  ."'"
exe "let s:fg_base2     = ' ctermfg=".s:base2  ."'"
exe "let s:fg_base3     = ' ctermfg=".s:base3  ."'"
exe "let s:fg_green     = ' ctermfg=".s:green  ."'"
exe "let s:fg_yellow    = ' ctermfg=".s:yellow ."'"
exe "let s:fg_orange    = ' ctermfg=".s:orange ."'"
exe "let s:fg_red       = ' ctermfg=".s:red    ."'"
exe "let s:fg_magenta   = ' ctermfg=".s:magenta."'"
exe "let s:fg_violet    = ' ctermfg=".s:violet ."'"
exe "let s:fg_blue      = ' ctermfg=".s:blue   ."'"
exe "let s:fg_cyan      = ' ctermfg=".s:cyan   ."'"

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

exe "let s:fmt_none     = ' cterm=NONE'"
exe "let s:fmt_bold     = ' cterm=bold'"
exe "let s:fmt_undr     = ' cterm=underline'"
exe "let s:fmt_curl     = ' cterm=undercurl'"
exe "let s:fmt_ital     = ' cterm=italic'"
exe "let s:fmt_stnd     = ' cterm=standout'"
exe "let s:fmt_revr     = ' cterm=reverse'"

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
exe "hi! VertSplit"      .s:fmt_revr   .s:fg_base02 .s:bg_base00
exe "hi! WinSeparator"   .s:fmt_none   .s:fg_base01 .s:bg_base03
exe "hi! Title"          .s:fmt_bold   .s:fg_base00 .s:bg_none
exe "hi! VisualNOS"      .s:fmt_stnd   .s:fg_none   .s:bg_base02 .s:fmt_revr
exe "hi! WarningMsg"     .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! WildMenu"       .s:fmt_none   .s:fg_base2  .s:bg_base02 .s:fmt_revr
exe "hi! Folded"         .s:fmt_bold   .s:fg_base0  .s:bg_base02 .s:sp_base03
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
exe "hi! Pmenu"          .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:fmt_revr
exe "hi! PmenuSel"       .s:fmt_none   .s:fg_base01 .s:bg_base2   .s:fmt_revr
exe "hi! PmenuSbar"      .s:fmt_none   .s:fg_base2  .s:bg_base0   .s:fmt_revr
exe "hi! PmenuThumb"     .s:fmt_none   .s:fg_base0  .s:bg_base03  .s:fmt_revr
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

exe "hi! DiagnosticUnderlineError"   .s:fmt_undr   .s:fg_red    .s:bg_none
exe "hi! DiagnosticUnderlineWarn"    .s:fmt_undr   .s:fg_orange .s:bg_none
exe "hi! DiagnosticUnderlineInfo"    .s:fmt_undr   .s:fg_yellow .s:bg_none
exe "hi! DiagnosticUnderlineHint"    .s:fmt_undr   .s:fg_base0  .s:bg_none
exe "hi! DiagnosticUnderlineOk"      .s:fmt_undr   .s:fg_green  .s:bg_none

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
