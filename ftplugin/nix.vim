" 0. Initialization
" =================

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal nosmartindent

" Setup indentation expression:
setlocal indentexpr=GetNixIndent()
" Define keys that trigger indentation:
setlocal indentkeys=0{,0},0[,0],!^F,o,O,e

" Only define the function once.
if exists("*GetNixIndent")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" 1. Variables
" ============

" 2. Auxiliary Functions
" ======================

" Check if the character at lnum:col is inside a string.
" This function seems not to be reliable
function s:IsInString(lnum, col)
  let nixTypeId = synID(a:lnum, a:col, 1)
  if !nixTypeId
      return 0
  endif
  let nixTypeName = synIDattr(nixTypeId, 'name')
  " let answer = synIDattr(synID(a:lnum, a:col, 1), 'name') == 'nixSimpleString'
  " let answer = index(['nixString', 'nixSimpleString'], synIDattr(synID(a:lnum, a:col, 1), 'name')) >= 0
  let answer = index(['nixSimpleString'], synIDattr(synID(a:lnum, a:col, 1), 'name')) >= 0
  return answer
endfunction

" Check if line 'lnum' has more opening brackets than closing ones.
function s:LineHasOpeningBrackets(lnum)
  " Return a string composed of '0' and '1' indicating for each type of brace
  " ('{', '['') if there are more opening brace than closing brace
  let open_0 = 0 " Number of open '{': '{' lead to 1, '}' lead to '-1'
  let open_2 = 0 " Number of open '[': '[' lead to 1, ']' lead to '-1'
  let line = getline(a:lnum)
  " Get the non string line part:
  let line = substitute(line, '"[^\\"]*\%(\\.[^\\"]*\)*"', '', 'g')
  " Get the non comment part:
  let line = substitute(line, '#.*$', '', '')
  let pos = match(line, '[][{}]', 0)
  while pos != -1
    let idx = stridx('[]{}', line[pos])
    if idx % 2 == 0
      " Open brace:
      let open_{idx} = open_{idx} + 1
    else
      " Close brace:
      let open_{idx - 1} = open_{idx - 1} - 1
    endif
    let pos = match(line, '[][{}]', pos + 1)
  endwhile
  " return (open_0 > 0) . (open_2 > 0) . (open_4 > 0)
  return (open_0 > 0) || (open_2 > 0)
endfunction

" 3. GetNixIndent Function
" =========================

function GetNixIndent()
  " 3.1. Setup
  " ----------

  " Set up variables for restoring position in file.  Could use v:lnum here.
  let vcol = col('.')

  " 3.2. Work on the current line
  " -----------------------------

  " Get the current line.
  let line = getline(v:lnum)
  let ind = -1

  " If we got a closing bracket on an empty line, find its match and indent
  " according to it.
  let col = matchend(line, '^\s*[]}]')

  if col > 0 && !s:IsInString(v:lnum, col)
    call cursor(v:lnum, col)
    let bs = strpart('{}[]', stridx('}]', line[col - 1]) * 2, 2)

    let pairstart = escape(bs[0], '[')
    let pairend = escape(bs[1], ']')
    " let pairline = searchpair(pairstart, '', pairend, 'bW', "synIDattr(synID(line('.'), col('.'), 0), 'name') =~? '\\(nixString\\|nixSimpleString\\|nixComment\\)'")
    let pairline = searchpair(pairstart, '', pairend, 'bW', "synIDattr(synID(line('.'), col('.'), 0), 'name') =~? '\\(nixSimpleString\\|nixComment\\)'")

    if pairline > 0
      let ind = indent(pairline)
    else
      let ind = virtcol('.') - 1
    endif

    return ind
  endif

  " 3.3. Work on the previous line.
  " -------------------------------

  let lnum = prevnonblank(v:lnum - 1)

  if lnum == 0
    return 0
  endif

  " Set up variables for current line.
  let line = getline(lnum)
  let ind = indent(lnum)

  " If the previous line contained an opening bracket add indent
  if line =~ '[[{]'
    let line_has_opening_brackets = s:LineHasOpeningBrackets(lnum)
    if line_has_opening_brackets > 0
      return ind + shiftwidth()
    else
      " return ind
      call cursor(v:lnum, vcol)
    end
  endif

  return ind
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
