" File: jasmine-dark.vim
" Description: A Espresso inspired dark version of my light theme
" Author: akaibureido
" Highlighting Function Borrowed From: morhetz's gruvbox theme
" -----------------------------------------------------------------------------

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "JasmineDark"

" Color Pallette: {{{
let s:ce = {}

let s:ce.dark0        = ['#282828', 16]
let s:ce.dark1        = ['#2D2D2D', 16]
let s:ce.dark2        = ['#4E4E4E', 59]
let s:ce.dark3        = ['#656565', 59]
let s:ce.dark4        = ['#777777', 102]
let s:ce.light4       = ['#C9C9C9', 188]
let s:ce.light3       = ['#DCDCDC', 188]
let s:ce.light2       = ['#EDEDED', 231]
let s:ce.light1       = ['#FAFAFA', 231]
let s:ce.light0       = ['#FFFFFF', 231]

let s:ce.red          = ['#D84A53', 167]
let s:ce.faintRed     = ['#392526', 52]

let s:ce.orange       = ['#BA671F', 130]
let s:ce.lightOrange  = ['#E49953', 173]
let s:ce.faintOrange  = ['#302721', 52]

let s:ce.yellow       = ['#D3C414', 184]
let s:ce.faintYellow  = ['#434013', 52]

let s:ce.green        = ['#5D9629', 64]
let s:ce.faintGreen   = ['#2E3924', 22]

let s:ce.blue         = ['#3072AF', 61]
let s:ce.lightBlue    = ['#53A0CD', 74]
let s:ce.faintBlue    = ['#242D33', 231]

let s:ce.magenta      = ['#8759B4', 97]
let s:ce.darkMagenta  = ['#9175AC', 53]
let s:ce.faintMagenta = ['#2D2536', 16]

let s:ce.cursor       = ['#0F617F', 24]
" }}}
" Highlighting Function: {{{
function! s:HL(group, fg, ...)
	" Arguments: group, guifg, guibg, gui, guisp

	let histring = 'hi ' . a:group . ' '

  try
    if strlen(a:fg)
      if a:fg == 'fg'
        let histring .= 'guifg=fg ctermfg=fg '
      elseif a:fg == 'bg'
        let histring .= 'guifg=bg ctermfg=bg '
      elseif a:fg == 'none'
        let histring .= 'guifg=NONE ctermfg=NONE '
      else
        let c = get(s:ce, a:fg)
        let histring .= 'guifg=' . c[0] . ' ctermfg=' . c[1] . ' '
      endif
    endif

    if a:0 >= 1 && strlen(a:1)
      if a:1 == 'bg'
        let histring .= 'guibg=bg ctermbg=bg '
      elseif a:fg == 'fg'
        let histring .= 'guibg=fg ctermbg=fg '
      elseif a:1 == 'none'
        let histring .= 'guibg=NONE ctermfg=NONE '
      else
        let c = get(s:ce, a:1)
        let histring .= 'guibg=' . c[0] . ' ctermbg=' . c[1] . ' '
      endif
    else
      let histring .= 'guibg=NONE ctermbg=NONE '
    endif

    if a:0 >= 2 && strlen(a:2)
      if a:2 == 'none'
        let histring .= 'gui=NONE cterm=NONE '
      elseif a:2 == 'italic' && !has("gui_running")
        let histring .= 'gui=NONE cterm=underline '
      elseif a:2 == 'bold,italic' && !has("gui_running")
        let histring .= 'gui=NONE cterm=bold,underline '
      else
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
      endif
    else
      let histring .= 'gui=NONE cterm=NONE '
    endif

    if a:0 >= 3 && strlen(a:3)
      if a:3 == 'none'
        let histring .= 'guisp=NONE '
      else
        let c = get(s:ce, a:3)
        let histring .= 'guisp=' . c[0] . ' '
      endif
    endif
	execute histring

  catch
  endtry  
endfunction
" }}}
 
" General Color Groups: {{{1
" Text: {{{2
call s:HL('Normal', 'dark4','dark0','NONE')
call s:HL('NonText', 'dark2','dark0','NONE')
call s:HL('Directory', 'NONE','NONE','NONE')

" Cursor: {{{2
call s:HL('Cursor', 'light0','cursor','NONE')
call s:HL('CursorColumn', 'NONE','dark1','NONE')
call s:HL('CursorLine', 'NONE','dark1','NONE')

" Selection: {{{2
call s:HL('Visual', 'NONE','NONE','inverse')

" Line Numbers: {{{2
call s:HL('LineNr', 'dark2','dark1','NONE')
call s:HL('CursorLineNr', 'dark2', 'NONE')

" Dividers: {{{2
call s:HL('VertSplit', 'dark3','dark1','NONE')
call s:HL('StatusLine', 'dark1','light3','bold')
call s:HL('StatusLineNC', 'dark1','light3','NONE')

" Folding: {{{2
call s:HL('Folded', 'dark4','dark1','NONE')
call s:HL('FoldColumn', 'blue', 'dark1', 'bold')

" SignColumn: {{{2
call s:HL('SignColumn', 'blue', 'dark2', 'bold')

" Paranthesis: {{{2
call s:HL('MatchParen', 'red','NONE','NONE')

" Search: {{{2
call s:HL('IncSearch', 'green','faintGreen','NONE')
call s:HL('Search', 'red','faintRed','underline')

" Completion Menu: {{{2
call s:HL('Pmenu', 'red','dark1','NONE')
call s:HL('PmenuSel', 'green','dark2','bold')

" Errors And Warnings: {{{2
call s:HL('Error', 'red', 'dark0', 'underline')
call s:HL('ErrorMsg', 'light0', 'red', 'NONE')
call s:HL('WarningMsg', 'light0', 'yellow', 'NONE')

call s:HL('Underlined', 'NONE', 'NONE', 'underline')

" }}}
" Syntax: {{{2
call s:HL('Special', 'red', 'NONE', 'NONE')

call s:HL('Comment', 'dark3', 'NONE', 'NONE')
call s:HL('PreProc', 'blue', 'NONE', 'NONE')
call s:HL('PreCondit', 'blue', 'NONE', 'NONE')
call s:HL('Include', 'blue', 'NONE', 'NONE')
call s:HL('Define', 'magenta', 'NONE', 'NONE')
call s:HL('Macro', 'magenta', 'NONE', 'NONE')
call s:HL('Function', 'magenta', 'NONE', 'bold')

call s:HL('Statement', 'blue', 'NONE', 'NONE')
call s:HL('Keyword', 'blue', 'NONE', 'NONE')
call s:HL('Label', 'green', 'NONE', 'NONE')
call s:HL('Conditional', 'blue', 'NONE', 'NONE')
call s:HL('Exception', 'NONE', 'NONE', 'NONE')
call s:HL('Repeat', 'magenta', 'NONE', 'NONE')
call s:HL('Operator', 'blue', 'NONE', 'NONE')
call s:HL('Identifier', 'magenta', 'NONE', 'NONE')

call s:HL('StorageClass', 'red', 'NONE', 'NONE')
call s:HL('Typedef', 'red', 'NONE', 'NONE')
call s:HL('Type', 'red', 'NONE', 'NONE')
call s:HL('Constant', 'NONE', 'NONE', 'NONE')
call s:HL('Boolean', 'NONE', 'NONE', 'NONE')
call s:HL('Number', 'magenta', 'faintMagenta', 'NONE')
call s:HL('Float', 'magenta', 'NONE', 'NONE')
call s:HL('Character', 'NONE', 'NONE', 'NONE')
call s:HL('String', 'orange', 'faintOrange', 'NONE')
call s:HL('Structure', 'red', 'NONE', 'NONE')

call s:HL('SpecialKey', 'dark4', 'light2', 'NONE')
call s:HL('Tag', 'blue', 'NONE', 'NONE')
call s:HL('Title', 'dark4', 'NONE', 'bold')
call s:HL('Todo', 'dark3', 'NONE', 'inverse, bold')

" }}}1
" Filetype Specific: {{{1
" Diff: {{{2
call s:HL('DiffDelete', 'NONE', 'faintRed')
call s:HL('DiffAdd',    'NONE', 'faintGreen')
call s:HL('DiffChange', 'NONE', 'faintBlue')
call s:HL('DiffText',   'NONE', 'faintYellow')

" Ruby: {{{2
call s:HL('rubyClass', 'magenta','NONE','NONE')
call s:HL('rubyModule', 'magenta','NONE','NONE')
call s:HL('rubyFunction', 'NONE','NONE','bold')
call s:HL('rubyInterpolationDelimiter', 'NONE','NONE','NONE')
call s:HL('rubySymbol', 'magenta','NONE','NONE')
call s:HL('rubyConstant', 'NONE','NONE','NONE')
call s:HL('rubyStringDelimiter', 'lightOrange','faintOrange','NONE')
call s:HL('rubyInterpolation', 'NONE','faintOrange','NONE')
call s:HL('rubyInterpolationDelimiter', 'green','faintOrange','NONE')
call s:HL('rubyBlockParameter', 'NONE','NONE','NONE')
call s:HL('rubyInstanceVariable', 'red','NONE','NONE')
call s:HL('rubyInclude', 'red','NONE','NONE')
call s:HL('rubyGlobalVariable', 'NONE','NONE','NONE')
call s:HL('rubyRegexp', 'green','NONE','NONE')
call s:HL('rubyRegexpDelimiter', 'green','NONE','NONE')
call s:HL('rubyEscape', 'NONE','NONE','NONE')
call s:HL('rubyControl', 'magenta','NONE','NONE')
call s:HL('rubyClassVariable', 'NONE','NONE','NONE')
call s:HL('rubyOperator', 'blue','NONE','NONE')
call s:HL('rubyException', 'blue','NONE','NONE')
call s:HL('rubyPseudoVariable', 'NONE','NONE','NONE')
call s:HL('rubyRailsUserClass', 'NONE','NONE','NONE')
call s:HL('rubyRailsARAssociationMethod', 'NONE','NONE','NONE')
call s:HL('rubyRailsARMethod', 'NONE','NONE','NONE')
call s:HL('rubyRailsRenderMethod', 'NONE','NONE','NONE')
call s:HL('rubyRailsMethod', 'NONE','NONE','NONE')
call s:HL('erubyDelimiter', 'NONE','NONE','NONE')
call s:HL('erubyComment', 'dark3','NONE','NONE')
call s:HL('erubyRailsMethod', 'NONE','NONE','NONE')

" SQL: {{{2 
call s:HL('sqlStatement', 'blue','NONE','NONE')
call s:HL('sqlKeyword', 'red','NONE','NONE')
call s:HL('sqlSpecial', 'magenta','faintMagenta','NONE')

" HTML: {{{2
call s:HL('htmlTag', 'lightBlue','NONE','NONE')
call s:HL('htmlEndTag', 'lightBlue','NONE','NONE')
call s:HL('htmlTagName', 'blue','faintBlue','NONE')
call s:HL('htmlSpecialTagName', 'blue','faintBlue','NONE')
call s:HL('htmlArg', 'lightBlue','NONE','NONE')
call s:HL('htmlSpecialChar', 'NONE','NONE','NONE')
call s:HL('htmlString', 'red','NONE','NONE')

" Markdown: {{{2
call s:HL('markdownBold', 'NONE','dark1','bold')
call s:HL('markdownItalic', 'NONE','dark1','italic')
call s:HL('markdownHeadingRule', 'red','NONE','bold')
call s:HL('markdownHeadingDelimiter', 'dark4','NONE','NONE')
call s:HL('markdownH1', 'red','faintRed','bold')
call s:HL('markdownH2', 'red','faintRed','bold')
call s:HL('markdownH3', 'blue','faintBlue','bold')
call s:HL('markdownH4', 'green','faintGreen','bold')
call s:HL('markdownH5', 'NONE','light2','bold')
call s:HL('markdownListMarker', 'magenta','NONE','italic')

" JavaScript Generic: {{{2
call s:HL('javaScriptFunction', 'NONE','NONE','NONE')
call s:HL('javaScriptFuncKeyword', 'magenta','NONE','NONE')
call s:HL('javaScriptRailsFunction', 'NONE','NONE','NONE')
call s:HL('javaScriptBraces', 'NONE','NONE','NONE')

" Pangloss VimJavaScript: {{{2
call s:HL('jsStorageClass', 'magenta','NONE','NONE')
call s:HL('jsFloat', 'magenta','faintMagenta','NONE')
call s:HL('jsBooleanFalse', 'magenta','faintMagenta','NONE')
call s:HL('jsBooleanTrue', 'magenta','faintMagenta','NONE')
call s:HL('jsNull', 'magenta','faintMagenta','NONE')
call s:HL('jsFunction', 'magenta','NONE','NONE')
call s:HL('jsFuncName', 'darkMagenta','NONE','bold')
call s:HL('jsFunctionKey', 'darkMagenta','NONE','bold')
call s:HL('jsObjectKey', 'red','NONE','NONE')
call s:HL('jsGlobalObjects', 'blue','faintBlue','NONE')
call s:HL('jsException', 'red','faintRed','NONE')
call s:HL('jsConditional', 'magenta','NONE','NONE')
call s:HL('jsStringD', 'orange','faintOrange','NONE')
call s:HL('jsReturn', 'magenta','NONE','NONE')
call s:HL('jsRegexpString', 'magenta','NONE','NONE')
call s:HL('jsRegexpCharClass', 'magenta','NONE','bold')
call s:HL('jsRegexpBoundary', 'magenta','NONE','NONE')
call s:HL('jsRegexpQuantifier', 'magenta','NONE','NONE')
call s:HL('jsRegexpOr', 'magenta','NONE','NONE')
call s:HL('jsRegexpGroup', 'magenta','faintMagenta','NONE')

" Yaml: {{{2
call s:HL('yamlKey', 'blue','NONE','NONE')
call s:HL('yamlAnchor', 'NONE','NONE','NONE')
call s:HL('yamlAlias', 'NONE','NONE','NONE')
call s:HL('yamlDocumentHeader', 'green','NONE','NONE')

" CSS: {{{2
call s:HL('cssURL', 'NONE','NONE','NONE')
call s:HL('cssFunctionName', 'NONE','NONE','NONE')
call s:HL('cssColor', 'green','NONE','NONE')
call s:HL('cssPseudoClassId', 'red','NONE','NONE')
call s:HL('cssClassName', 'red','NONE','NONE')
call s:HL('cssValueLength', 'magenta','faintMagenta','NONE')
call s:HL('cssValueNumber', 'magenta','faintMagenta','NONE')
call s:HL('cssCommonAttr', 'NONE','NONE','NONE')
call s:HL('cssBraces', 'dark0','NONE','NONE')

" Vim: {{{2
call s:HL('vimCommentTitle', 'red','NONE','NONE')
call s:HL('vimIsCommand', 'blue','NONE','NONE')

" }}}1
" Plugins: {{{1
" Ycm: {{{2
call s:HL('YcmErrorSign', 'red', 'light1', 'inverse')
call s:HL('YcmWarningSign', 'yellow', 'light1', 'inverse')

" Indent Line Plugin: {{{2
call s:HL('IndentLine', 'light2','NONE','NONE')

" Ctags TagHighlighter {{{2
call s:HL('CTagsFunction', 'magenta', 'NONE', 'bold')
call s:HL('CTagsClass', 'magenta', 'NONE', 'NONE')
call s:HL('CTagsMember', 'green', 'NONE', 'NONE')

" Better Rainbow Parentheses: {{{2

let g:rbpt_colorpairs = [
      \ ['brown',       '#458588'],
      \ ['Darkblue',    '#b16286'],
      \ ['darkgray',    '#cc241d'],
      \ ['darkgreen',   '#d65d0e'],
      \ ['darkcyan',    '#458588'],
      \ ['darkred',     '#b16286'],
      \ ['darkmagenta', '#cc241d'],
      \ ['brown',       '#d65d0e'],
      \ ['gray',        '#458588'],
      \ ['black',       '#b16286'],
      \ ['darkmagenta', '#cc241d'],
      \ ['Darkblue',    '#d65d0e'],
      \ ['darkgreen',   '#458588'],
      \ ['darkcyan',    '#b16286'],
      \ ['darkred',     '#cc241d'],
      \ ['red',         '#d65d0e'],
      \ ]

" Tagbar: {{{2
call s:HL('TagbarSignature', 'orange','faintOrange','NONE')
call s:HL('TagbarVisibilityPublic', 'green','faintGreen','NONE')
call s:HL('TagbarVisibilityPrivate', 'red','faintRed','NONE')
call s:HL('TagbarVisibilityProtected', 'magenta','NONE','NONE')

" }}}1

" vim:foldmethod=marker
