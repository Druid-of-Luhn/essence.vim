" File:         essence.vim
" Author:       Billy Brown
" Description:  Syntax highlighting for the Essence and Essence' modelling languages.
" Version:      1.0

if exists('b:current_syntax')
    finish
endif

" Essence language declaration
syntax match essenceLanguage "language \(Essence\|ESSENCE\)'\= \d\.\d"

" Keywords in comments
syntax keyword essenceNote contained FIXME NOTE TODO XXX

" Comments
syntax match essenceComment '$.*$'
            \ contains=@Spell       " Only check spelling in comments
            \ contains=essenceNote

" Numbers
syntax match essenceNumber '\([a-zA-Z_0-9]\)\@<!\d\+'

" Boolean values
syntax keyword essenceBoolean false true

" Keywords
syntax keyword essenceKeyword
            \ be
            \ branching
            \ by
            \ dim
            \ domain
            \ exists
            \ find
            \ forAll
            \ from
            \ given
            \ in
            \ indexed
            \ intersect
            \ lambda
            \ letting
            \ maximising
            \ minimising
            \ new
            \ of
            \ on
            \ quantifier
            \ representation
            \ subset
            \ subsetEq
            \ such
            \ sum
            \ supset
            \ supsetEq
            \ that
            \ type
            \ union
            \ where

" Kinds
syntax keyword essenceKind
            \ bool
            \ enum
            \ function
            \ int
            \ matrix
            \ mset
            \ partition
            \ relation
            \ set
            \ tuple

" Types
syntax keyword essenceType
            \ bijective
            \ complete
            \ injective
            \ maxNumParts
            \ maxOccur
            \ maxPartSize
            \ maxSize
            \ minNumParts
            \ minOccur
            \ minPartSize
            \ minSize
            \ numParts
            \ partSize
            \ partial
            \ regular
            \ size
            \ surjective
            \ total

" Functions
syntax keyword essenceFunction
            \ allDiff
            \ alldifferent_except
            \ and
            \ apart
            \ atleast
            \ atmost
            \ defined
            \ factorial
            \ flatten
            \ freq
            \ gcc
            \ hist
            \ image
            \ imageSet
            \ inverse
            \ max
            \ min
            \ or
            \ participants
            \ parts
            \ party
            \ powerSet
            \ preImage
            \ pred
            \ product
            \ range
            \ restrict
            \ subsequence
            \ substring
            \ succ
            \ sum
            \ table
            \ toInt
            \ toMSet
            \ toRelation
            \ toSet
            \ together
            \ xor

" Operators
syntax match essenceArithmeticOperator '+'
syntax match essenceArithmeticOperator '-'
syntax match essenceArithmeticOperator '\*'
syntax match essenceArithmeticOperator '/'
syntax match essenceArithmeticOperator '%'
syntax match essenceArithmeticOperator '\^'

syntax match essenceLogicalOperator '!'
syntax match essenceLogicalOperator '->'
syntax match essenceLogicalOperator '<->'
syntax match essenceLogicalOperator '/\\'
syntax match essenceLogicalOperator '\\/'
syntax match essenceLogicalOperator '|'

syntax match essenceComparisonOperator '='
syntax match essenceComparisonOperator '!='
syntax match essenceComparisonOperator '<'
syntax match essenceComparisonOperator '>'
syntax match essenceComparisonOperator '<='
syntax match essenceComparisonOperator '>='
syntax match essenceComparisonOperator '<lex'
syntax match essenceComparisonOperator '>lex'
syntax match essenceComparisonOperator '<=lex'
syntax match essenceComparisonOperator '>=lex'

" Special infix symbols
syntax match essenceSpecialInfix '-->'
syntax match essenceSpecialInfix '\.'
syntax match essenceSpecialInfix ','
syntax match essenceSpecialInfix ':'

" Set highlights
highlight default link essenceLanguage              Special
highlight default link essenceNote                  Todo
highlight default link essenceComment               Comment
highlight default link essenceNumber                Number
highlight default link essenceBoolean               Boolean

highlight default link essenceKeyword               Keyword
highlight default link essenceKind                  Type
highlight default link essenceType                  Identifier
highlight default link essenceFunction              Function

highlight default link essenceArithmeticOperator    Operator
highlight default link essenceLogicalOperator       Operator
highlight default link essenceComparisonOperator    Operator
highlight default link essenceSpecialInfix          Delimiter

let b:current_syntax = 'essence'

" Following adapted from https://github.com/Bilalh/Essence-Syntax-Highlighting

" conjureLog
syntax match conjureLog '^\[\a\{-}\]'
highlight default link conjureLog Special

" Conceal operators with nicer symbols
if exists('g:no_essence_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

if exists('g:essence_conceal')
    syntax keyword essenceNiceOperator exists       conceal cchar=∃
    syntax keyword essenceNiceOperator forAll       conceal cchar=∀
    syntax keyword essenceNiceOperator in           conceal cchar=∈
    syntax keyword essenceNiceOperator intersect    conceal cchar=∩
    syntax keyword essenceNiceOperator lambda       conceal cchar=λ
    syntax keyword essenceNiceOperator subset       conceal cchar=⊂
    syntax keyword essenceNiceOperator subsetEq     conceal cchar=⊆
    syntax keyword essenceNiceOperator sum          conceal cchar=∑
    syntax keyword essenceNiceOperator supset       conceal cchar=⊃
    syntax keyword essenceNiceOperator supsetEq     conceal cchar=⊇
    syntax keyword essenceNiceOperator union        conceal cchar=∪

    syntax match essenceNiceOperator '\*'   conceal cchar=×
    syntax match essenceNiceOperator '!'    conceal cchar=¬
    syntax match essenceNiceOperator '->'   conceal cchar=⇒
    syntax match essenceNiceOperator '<->'  conceal cchar=⇔
    syntax match essenceNiceOperator '!='   conceal cchar=≠
    syntax match essenceNiceOperator '<='   conceal cchar=≤
    syntax match essenceNiceOperator '>='   conceal cchar=≥
    syntax match essenceNiceOperator '/\\'  conceal cchar=∧
    syntax match essenceNiceOperator '\\/'  conceal cchar=∨
    syntax match essenceNiceOperator '-->'  conceal cchar=→

    highlight link essenceNiceOperator Operator
    highlight! link Conceal Operator
    setlocal conceallevel=2
endif
