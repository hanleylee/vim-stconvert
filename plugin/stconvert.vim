" vim: ts=4 nowrap ft=vim

" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if exists('b:loaded_stconvert_plugin')
    finish
endif
let b:loaded_stconvert_plugin = 1

if executable('opencc')
    " Simplified Chinese to Traditional Chinese 简体到繁体
    command! -range=% -nargs=0 S2T      let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c s2t' | call winrestview(b:view)
    " Traditional Chinese to Simplified Chinese 繁体到简体
    command! -range=% -nargs=0 T2S      let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c t2s' | call winrestview(b:view)
    " Simplified Chinese to Traditional Chinese (Taiwan Standard) 简体到台湾正体
    command! -range=% -nargs=0 S2TW     let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c s2tw' | call winrestview(b:view)
    " Traditional Chinese (Taiwan Standard) to Simplified Chinese 台湾正体到简体
    command! -range=% -nargs=0 TW2S     let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c tw2s' | call winrestview(b:view)
    " Simplified Chinese to Traditional Chinese (Hong Kong variant) 简体到香港繁体
    command! -range=% -nargs=0 S2HK     let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c s2hk' | call winrestview(b:view)
    " Traditional Chinese (Hong Kong variant) to Simplified Chinese 香港繁体到简体
    command! -range=% -nargs=0 HK2S     let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c hk2s' | call winrestview(b:view)
    " Simplified Chinese to Traditional Chinese (Taiwan Standard) with Taiwanese idiom 简体到繁体（台湾正体标准）并转换为台湾常用词汇
    command! -range=% -nargs=0 S2TWP    let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c s2twp' | call winrestview(b:view)
    " Traditional Chinese (Taiwan Standard) to Simplified Chinese with Mainland Chinese idiom 繁体（台湾正体标准）到简体并转换为中国大陆常用词汇
    command! -range=% -nargs=0 TW2SP    let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c tw2sp' | call winrestview(b:view)
    " Traditional Chinese (OpenCC Standard) to Taiwan Standard 繁体（OpenCC 标准）到台湾正体
    command! -range=% -nargs=0 T2TW     let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c t2tw' | call winrestview(b:view)
    " Traditional Chinese (Hong Kong variant) to Traditional Chinese 香港繁体到繁体（OpenCC 标准）
    command! -range=% -nargs=0 HK2T     let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c hk2t' | call winrestview(b:view)
    " Traditional Chinese (OpenCC Standard) to Hong Kong variant 繁体（OpenCC 标准）到香港繁体
    command! -range=% -nargs=0 T2HK     let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c t2hk' | call winrestview(b:view)
    " Traditional Chinese Characters (Kyūjitai) to New Japanese Kanji (Shinjitai) 繁体（OpenCC 标准，旧字体）到日文新字体
    command! -range=% -nargs=0 T2JP     let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c t2jp' | call winrestview(b:view)
    " New Japanese Kanji (Shinjitai) to Traditional Chinese Characters (Kyūjitai) 日文新字体到繁体（OpenCC 标准，旧字体）
    command! -range=% -nargs=0 JP2T     let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c jp2t' | call winrestview(b:view)
    " Traditional Chinese (Taiwan standard) to Traditional Chinese 台湾正体到繁体（OpenCC 标准）
    command! -range=% -nargs=0 TW2T     let b:view = winsaveview() | execute <line1> . ',' . <line2> . '!opencc -c tw2t' | call winrestview(b:view)
else
    command! -range=% -nargs=0 S2T let b:view = winsaveview() | <line1>,<line2> call stconvert#S2T(<args>) | call winrestview(b:view)
    command! -range=% -nargs=0 T2S let b:view = winsaveview() | <line1>,<line2> call stconvert#T2S(<args>) | call winrestview(b:view)
    command! -range=% -nargs=0 Y2S let b:view = winsaveview() | <line1>,<line2> call stconvert#Y2S(<args>) | call winrestview(b:view)
    " command! -range=% -nargs=0 S2THK silent! <line1>,<line2> call s:S2T_HK(<args>)
    " command! -range=% -nargs=0 S2TTW silent! <line1>,<line2> call s:S2T_TW(<args>)
end
