" Aiken syntax file
" Language: Aiken
" Maintainer: KtorZ <matthias.benkort@gmail.com>
" Copyright: KtorZ <matthias.benkort@gmail.com>
" License: MPL-2.0

if exists('b:current_syntax')
  finish
endif

" Keywords
syn keyword aikenConditional if else when is
syn keyword aikenKeyword let
syn keyword aikenTypedef pub opaque const
syn keyword aikenException assert, todo
syn keyword aikenImport  use  nextgroup=aikenUseModPath  skipwhite skipempty
syn keyword aikenKeyword type nextgroup=aikenTypeName skipwhite skipempty
syn keyword aikenKeyword fn   nextgroup=aikenFuncName skipwhite skipempty
syn keyword aikenKeyword test nextgroup=aikenTestName skipwhite skipempty

" Functions
syn match aikenFuncName contained "\l\w*"

" Tests
syn match aikenTestName contained "\l\w*"

" Types
syn match aikenTypeName "\<[A-Z][0-9A-Za-z_]*"

" Modules
syn match aikenUseModPath    contained nextgroup=aikenUseModPathSep "\w\(\w\)*"
syn match aikenUseModPathSep contained nextgroup=aikenUseModPath    "/"

syn match aikenModPath       "\(\w\(\w\)*\.\)\+"

" Operators
" − assignment
syn match aikenOperator "="
" − ­arrow
syn match aikenOperator "->"
" − splat
syn match aikenOperator "\.\."
" − pipe
syn match aikenOperator "\(|>\||\)"
" − comparison
syn match aikenOperator "\(<=\|>=\|==\|!=\|<\|>\)"
" − logical
syn match aikenOperator "\(&&\|||\)"
" − arithmetic
syn match aikenOperator "\(+\|-\|*\|%\)"

" Literals
" − Strings
syn region aikenString start="\"" skip="\\." end="\"" contains=@spell
" − Numbers
syn match aikenInt     "-\?\<\d\+\>"
syn match aikenBinary  "\<0b[0-1_]\+\>"
syn match aikenOctal   "\<0o[0-7]\+\>"
syn match aikenHexa    "\<0x[0-9a-f]\+\>"

" Comments
syn keyword aikenTodo    NOTE TODO FIXME XXX contained
syn match   aikenComment "//.*" contains=aikenTodo,@spell

" Delimiters
syn match aikenBraces "[\.:{}()]"

hi def link aikenConditional Keyword
hi def link aikenTypedef Include
hi def link aikenException Special
hi def link aikenImport Include
hi def link aikenKeyword Keyword
hi def link aikenFuncName Identifier
hi def link aikenTestName Identifier
hi def link aikenTypeName Type
hi def link aikenModPath Function
hi def link aikenUseModPath Function
hi def link aikenUseModPathSep Delimiter
hi def link aikenOperator Operator
hi def link aikenString String
hi def link aikenInt Number
hi def link aikenBinary Number
hi def link aikenOctal Number
hi def link aikenHexa Number
hi def link aikenTodo Todo
hi def link aikenComment Comment
hi def link aikenBraces Delimiter

syn sync minlines=200
syn sync maxlines=500

let b:current_syntax = 'aiken'
