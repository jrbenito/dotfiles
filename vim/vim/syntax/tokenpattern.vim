" Vim Syntax file
" Language: Tokenpattern Generator
" Author: p.skorzewski

if exists("b:current_syntax")
    finish
endif

syn region tokenpatternString start=/"/ skip=/\\"/ end=/"/ contains=tokenpatternOperator,tokenpatternPriority,tokenpatternTokens
syn match tokenpatternStatement "@.*$" contains=tokenpatternKeyword,tokenpatternLoopOperator,tokenpatternLoopEnumerator
syn match tokenpatternComment "#.*$" contains=tokenpatternTodo
syn keyword tokenpatternTodo contained TODO
syn match tokenpatternPriority "!\d\+"
syn match tokenpatternTokens "\^\d\+"
syn match tokenpatternRange "[A-Za-z0-9_]*::"
syn region tokenpatternLoopStart start="^@for" end="@do$" contains=tokenpatternLoopOperator,tokenpatternLoopEnumerate,tpgT_WORD display
syn match tokenpatternLoopOperator ",\||" contained
syn region tokenpatternLoopEnumerate start="enumerate=" end="$" contains=tokenpatternLoopEnumerateOperator,tokenpatternLoopEnumerator
syn match tokenpatternLoopEnumerateOperator "enumerate=\|," contained
syn match tokenpatternLoopEnumerator "\d\+" contained
syn match tokenpatternLoopEnd "^@done$"
syn match tokenpatternOperator "<\|>\||\|?"
syn match tpgT_WORD "\w\@<!T\(OKEN\)\?_\w\+\>"

hi def link tokenpatternString String
hi def link tokenpatternLoopStart ModeMsg
hi def link tokenpatternLoopOperator Operator
hi def link tokenpatternLoopEnumerate PreProc
hi def link tokenpatternLoopEnumerateOperator Operator
hi def link tokenpatternLoopEnumerator Number
hi def link tokenpatternLoopEnd ModeMsg
hi def link tokenpatternComment Comment
hi def link tokenpatternTodo Todo
hi def link tokenpatternPriority Identifier
hi def link tokenpatternTokens NonText
hi def link tokenpatternRange Type
hi def link tokenpatternOperator Operator
hi def link tpgT_WORD Special

let b:current_syntax = 'tokenpattern'
