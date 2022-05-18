if exists("b:current_syntax")
  finish
endif

syn cluster soulNotTop contains=@soulStringContained,soulUnused
syn cluster soulStringContained contains=soulInterpolation

syn match soulKeyword '\(\.\|:\)\@<!\<\(import\|open\|alias\|use\|as\|end\|match\|with\|do\|cond\|trivial\|module\|enum\|class\|struct\)\>:\@!'

syn match soulComment '\v[/#]/.*$'
syn match soulNumber '\<-\?\d\(_\?\d\)*\(\.[^[:space:][:digit:]]\@!\(_\?\d\)*\)\?\([eE][-+]\?\d\(_\?\d\)*\)\?\>'
syn match soulUnit '(\s*)'
syn match soulAnnotation '\v\+\w+(\.\w+)*(\.\{\w+(\s*,\s*\w+)*(\s*,\s*)?\})?'
syn keyword soulBoolean True False
syn keyword soulSelf Self
syn keyword soulSpecialConstructors Ok Err Some None Cons Nil Never

syn match soulFunctionType '\v_?!?\@_?[a-z]\w*[!?]?'
syn match soulType '\v\~?[A-Z]\w*!?' contains=soulModule
syn match soulModule contained '\<[A-Z]\w*\>\%(\.\)\@='
syn match soulAtom '\v_?:_?[a-z]\w*\??'
syn match soulAtom '\v_?[a-z]\w*\??:'
syn match soulUnused '\%(\.\)\@<!\<_\w*\>\%((\)\@!'

syn match soulDelimEscape "\\[(<{\[)>}\]/\"'|]" transparent display contained contains=NONE

syn match soulAtomInterpolated ':\("\)\@=' contains=soulString
syn match soulString "\(\w\)\@<!?\%(\\\|[^\s\\]\)"

syn match soulOperator '?>'
syn match soulOperator '\v\+>|\+'
syn match soulOperator '\*>\|\*'
syn match soulOperator '0>\|1>\|2>\|3>\|4>\|5>\|6>\|7>\|8>\|9>'
syn match soulOperator '===\|==\|=>\|='
syn match soulOperator '!==\|!='
syn match soulOperator '<<<\|<<\|<=\|<?\|<\*\|<\+\|<|\|<-\|<0\|<1\|<2\|<3\|<4\|<5\|<6\|<7\|<8\|<9\|<'
syn match soulOperator '>>>\|>>\|>=\|>'
syn match soulOperator '->\|--\|-'
syn match soulOperator '&&&\|&&\|&'
syn match soulOperator '|||\|||\||>\||'
syn match soulOperator '\.\.'
syn match soulOperator "\^\^\^\|\^"
syn match soulOperator '::'
syn match soulOperator ';'

syn region soulString matchgroup=soulStringDelimiter start=+\z("\)+ end=+\z1+ skip=+\\\\\|\\\z1+ contains=@Spell,@soulStringContained
syn region soulString matchgroup=soulStringDelimiter start=+\z("""\)+ end=+^\s*\z1+ contains=@Spell,@soulStringContained
syn region soulInterpolation matchgroup=soulInterpolationDelimiter start="#(" end=")" contained contains=ALLBUT,soulComment,@soulNotTop

hi def link soulKeyword Keyword
hi def link soulComment Comment
hi def link soulOperator Operator
hi def link soulNumber Number
hi def link soulBoolean Boolean
hi def link soulSelf Type
hi def link soulAnnotation Type
hi def link soulFunctionType Number
hi def link soulSpecialConstructors Constant
hi def link soulUnit Constant
hi def link soulType Label
hi def link soulAtom Function
hi def link soulUnused Comment
hi def link soulModule Function
hi def link soulString String
hi def link soulDelimEscape Delimiter
hi def link soulStringDelimiter Delimiter
hi def link soulInterpolationDelimiter Delimiter

let b:current_syntax = "soul"
