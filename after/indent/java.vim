" Vim indent file
" Language:	Java
" Previous Maintainer: Toby Allsopp <toby.allsopp@peace.com>
" Current Maintainer: Hong Xu <hong@topbug.net>
" Homepage: http://www.vim.org/scripts/script.php?script_id=3899
"           https://github.com/xuhdev/indent-java.vim
" Last Change:	2016 Mar 7
" Version: 1.1
" License: Same as Vim.
" Copyright (c) 2012-2016 Hong Xu
" Before 2012, this file was maintained by Toby Allsopp.

" Indent Java anonymous classes correctly.
setlocal cindent cinoptions& cinoptions+=j1,(s,m1

" The "extends" and "implements" lines start off with the wrong indent.
setlocal indentkeys& indentkeys+=0=extends indentkeys+=0=implements

" Set the function to do the work.
setlocal indentexpr=GetJavaIndent()

let b:undo_indent = "set cin< cino< indentkeys< indentexpr<"

let s:keepcpo= &cpo
set cpo&vim

function! SkipJavaBlanksAndComments(startline)
  let lnum = a:startline
  while lnum > 1
    let lnum = prevnonblank(lnum)
    if getline(lnum) =~ '\*/\s*$'
      while getline(lnum) !~ '/\*' && lnum > 1
        let lnum = lnum - 1
      endwhile
      if getline(lnum) =~ '^\s*/\*'
        let lnum = lnum - 1
      else
        break
      endif
    elseif getline(lnum) =~ '^\s*//'
      let lnum = lnum - 1
    else
      break
    endif
  endwhile
  return lnum
endfunction

function! GetJavaIndent()

  " Java is just like C; use the built-in C indenting and then correct a few
  " specific cases.
  let theIndent = cindent(v:lnum)

  " If we're in the middle of a comment then just trust cindent
  if getline(v:lnum) =~ '^\s*\*'
    return theIndent
  endif

  " find start of previous line, in case it was a continuation line
  let lnum = SkipJavaBlanksAndComments(v:lnum - 1)

  " If the previous line starts with '@', we should have the same indent as
  " the previous one
  if getline(lnum) =~ '^\s*@.*[^({]$'
    return indent(lnum)
  endif

  let prev = lnum
  while prev > 1
    let next_prev = SkipJavaBlanksAndComments(prev - 1)
    if getline(next_prev) !~ ',\s*$'
      break
    endif
    let prev = next_prev
  endwhile

  " Try to align "throws" lines for methods and "extends" and "implements" for
  " classes.
  if getline(v:lnum) =~ '^\s*\(throws\|extends\|implements\)\>'
        \ && getline(lnum) !~ '^\s*\(throws\|extends\|implements\)\>'
    let theIndent = theIndent + shiftwidth()
  endif

  " correct for continuation lines of "throws", "implements" and "extends"
  let cont_kw = matchstr(getline(prev),
        \ '^\s*\zs\(throws\|implements\|extends\)\>\ze.*,\s*$')
  if strlen(cont_kw) > 0
    let amount = strlen(cont_kw) + 1
    if getline(lnum) !~ ',\s*$'
      let theIndent = theIndent - (amount + shiftwidth())
      if theIndent < 0
        let theIndent = 0
      endif
    elseif prev == lnum
      let theIndent = theIndent + amount
      if cont_kw ==# 'throws'
        let theIndent = theIndent + shiftwidth()
      endif
    endif
  elseif getline(prev) =~ '^\s*\(throws\|implements\|extends\)\>'
        \ && (getline(prev) =~ '{\s*$'
        \  || getline(v:lnum) =~ '^\s*{\s*$')
    let theIndent = theIndent - shiftwidth()
  endif

  " When the line starts with a }, try aligning it with the matching {,
  " skipping over "throws", "extends" and "implements" clauses.
  if getline(v:lnum) =~ '^\s*}\s*\(//.*\|/\*.*\)\=$'
    call cursor(v:lnum, 1)
    silent normal! %
    let lnum = line('.')
    if lnum < v:lnum
      while lnum > 1
        let next_lnum = SkipJavaBlanksAndComments(lnum - 1)
        if getline(lnum) !~ '^\s*\(throws\|extends\|implements\)\>'
              \ && getline(next_lnum) !~ ',\s*$'
          break
        endif
        let lnum = prevnonblank(next_lnum)
      endwhile
      return indent(lnum)
    endif
  endif

  " Below a line starting with "}" never indent more.  Needed for a method
  " below a method with an indented "throws" clause.
  let lnum = SkipJavaBlanksAndComments(v:lnum - 1)
  if getline(lnum) =~ '^\s*}\s*\(//.*\|/\*.*\)\=$' && indent(lnum) < theIndent
    let theIndent = indent(lnum)
  endif

  return theIndent
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo

" vi: sw=2 et
