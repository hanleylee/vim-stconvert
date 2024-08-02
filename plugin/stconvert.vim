" vim: ts=4 nowrap ft=vim

" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if exists('b:loaded_stconvert_plugin')
    finish
endif
let b:loaded_stconvert_plugin = 1

command! -range=% -nargs=0 S2T let b:view = winsaveview() | <line1>,<line2> call stconvert#S2T(<args>) | call winrestview(b:view)
command! -range=% -nargs=0 T2S let b:view = winsaveview() | <line1>,<line2> call stconvert#T2S(<args>) | call winrestview(b:view)
" command! -range=% -nargs=0 S2THK silent! <line1>,<line2> call s:S2T_HK(<args>)
" command! -range=% -nargs=0 S2TTW silent! <line1>,<line2> call s:S2T_TW(<args>)
