" Vim syntax for JSGF source files.
" Add to your .vimrc
" au BufRead,BufNewFile *.jsgf set filetype=jsgf
if exists("b:current_syntax")
finish
endif
"it overrides jsgfGrammarName if 'keyword' is used insted of 'match'
syn match jsgfKeyword 'grammar\|import\|public'
syn match jsgfGrammarName '\(\<grammar\)\s\+[A-Za-z]\(\w\|_\)*;' contains=jsgfKeyword,jsgfSymbols
syn match jsgfSymbols "\(\[\|\]\|=\|{\|}\|;\||\|+\|\*\|-\|,\|?\|:\|(\|)\)" display
syn match jsgfComment "\/\/.*$"
syn region jsgfComment start='/\*' end='\*/'
syn match jsgfRulename '<\w\+>'
syn match jsgfRuleDef '<\w\+>\s*=' contains=jsgfSymbols
syn match jsgfHeader '#.*$'
syn match jsgfSpecial '<NULL>\|<VOID>'

hi def link jsgfKeyword Keyword
hi def link jsgfComment Comment
hi def link jsgfSymbols Operator
hi def link jsgfRulename Constant
hi def link jsgfSpecial Special
hi def link jsgfRuleDef Identifier
hi def link jsgfHeader Type
hi def link jsgfGrammarName Type
let b:current_syntax = 'jsgf'
