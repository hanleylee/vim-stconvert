" vim: ts=4 nowrap ft=vim

" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if has("python3")
    let g:T2S_Py = "py3 "
    let g:T2S_Pyeval = function("py3eval")
    " echom g:T2S_Pyeval
else
    echoerr 'Error: has("python3") == 0'
    finish
endif

silent! exec g:T2S_Py "pass"
exec g:T2S_Py "import vim, sys, os, re, os.path"
exec g:T2S_Py "import stconvert"

function! stconvert#S2T() range
    call g:T2S_Pyeval("stconvert.char_convert('s2t')")
    " call winrestview(winview)
    " let l = a:firstline
    " for line in getline(a:firstline, a:lastline)
    "     let newCurLine=tr(line,s:jianti,s:fanti)
    "     call setline(l, newCurLine)
    "     let l = l + 1
    " endfor
endfunction

function! stconvert#T2S() range
    call g:T2S_Pyeval("stconvert.char_convert('t2s')")
endfunction
