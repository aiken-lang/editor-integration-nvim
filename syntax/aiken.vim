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
syn keyword aikenKeyword let expect as via once fail error todo
syn keyword aikenException trace
syn keyword aikenTopLevelDefinition const pub opaque
syn keyword aikenTopLevelDefinition use            nextgroup=aikenModLastPath,aikenModPath skipwhite skipempty
syn keyword aikenTopLevelDefinition type           nextgroup=aikenTypeName                 skipwhite skipempty
syn keyword aikenTopLevelDefinition validator      nextgroup=aikenTopLevelIdentifier       skipwhite skipempty
syn keyword aikenTopLevelDefinition test           nextgroup=aikenTopLevelIdentifier       skipwhite skipempty
syn match   aikenTopLevelDefinition "fn[^(]"me=e-1 nextgroup=aikenTopLevelIdentifier       skipwhite skipempty

" Identifiers
syn match aikenIdentifier         "\l\w*" contained
syn match aikenTopLevelIdentifier "\l\w*" contained

" Types
syn match  aikenTypeName      "\<[A-Z][0-9A-Za-z_]*" nextgroup=aikenTypeArgs
syn match  aikenTypeParameter "\l\w*" contained
syn region aikenTypeArgs start="<" end=">" contains=aikenTypeName,aikenTypeParameter

" Functions
syn match aikenFuncCall "\l\w*("me=e-1 contains=aikenFuncArgs
syn region aikenFuncArgs start="("ms=s+1 end=")"me=e-1 contains=aikenString,aikenByteString,aikenHexString,aikenInt,aikenHex,aikenOperator,aikenConditional,aikenTypeName,aikenFuncCall
syn match aikenTopLevelDefinition "fn("me=e-1 skipwhite skipempty

" Module access
syn match aikenModAccess "\l\w*\.\ze\l\w*("me=e-1
syn match aikenModAccess "\l\w*\.\ze\u\w*"me=e-1

" Modules
syn match aikenModPath     "\w\(\w\)*"                 contained nextgroup=aikenModPathSep
syn match aikenModLastPath "\w\(\w\)*\."               contained nextgroup=aikenModImports
syn match aikenModPathSep  "/"                         contained nextgroup=aikenModLastPath,aikenModPath
syn region aikenModImports start="{" end="}" skip=","  contained contains=aikenModImport,aikenTypeName skipwhite skipempty
syn match aikenModImport   "\l\w*" contained containedin=aikenModImports

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
syn match aikenOperator "\(&&\|||\|!\)"
syn keyword aikenOperator or and
syn match aikenStringOperator "\(#\|@\)"
" − arithmetic
syn match aikenOperator "\(+\|-\|*\|%\)"
" − traceIfFalse
syn match aikenOperator "?"
" − ­tuple access
syn match aikenOperator "\(1st\|2nd\|3rd\|4th\|5th\|6th\|7th\|8th\|9th\)"

" Literals
" − Strings
syn match aikenStringEscape "\\u[0-9a-fA-F]\{4}" contained
syn match aikenStringEscape "\\[nrfvbt\\\"]" contained
syn region aikenString start="@\""ms=s+1 skip="\\\"" end="\"" contains=aikenStringEscape,@spell
syn region aikenByteString start="\"" skip="\\\"" end="\"" contains=aikenStringEscape,@spell
syn region aikenHexString start="#\""ms=s+1 skip="\\\"" end="\"" contains=@spell

" − Numbers
syn match aikenInt     "-\?\<\d\+\>"
syn match aikenHex     "\<0x[0-9a-f]\+\>"

" Comments
syn keyword aikenTodo NOTE TIP IMPORTANT WARNING CAUTION contained
syn match aikenComment "//.*"   contains=aikenTodo,@spell
syn match aikenComment "///.*"  contains=aikenTodo,@spell
syn match aikenComment "////.*" contains=aikenTodo,@spell

syn match aikenBool "\(\<True\>\|\<False\>\)"

" Delimiters
syn match aikenBraces "[\.:{}(),]"

" Fold regions
syn region aikenFold start="{" end="}" fold transparent keepend

" Highlights
hi def link aikenTopLevelDefinition Include
hi def link aikenTopLevelIdentifier Identifier
hi def link aikenIdentifier Identifier

hi def link aikenModAccess Identifier
hi def link aikenFuncCall Function

hi def link aikenConditional Conditional
hi def link aikenKeyword Keyword

hi def link aikenTypeName Type
hi def link aikenTypeArgs None
hi def link aikenTypeParameter Type

hi def link aikenModPath Identifier
hi def link aikenModLastPath Identifier
hi def link aikenModPathSep Delimiter
hi def link aikenModImports Delimiter
hi def link aikenModImport Function

hi def link aikenOperator Operator
hi def link aikenStringOperator Macro
hi def link aikenString Character
hi def link aikenByteString String
hi def link aikenHexString String
hi def link aikenInt Number
hi def link aikenHex Number
hi def link aikenBraces Delimiter
hi def link aikenBool Boolean

hi def link aikenTodo Todo
hi def link aikenComment Comment

hi def link aikenException Special

syn sync fromstart

let b:current_syntax = 'aiken'
