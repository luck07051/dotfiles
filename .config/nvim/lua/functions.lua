
local cmd = vim.cmd


cmd [[
function! MyFoldText() "{{{
    let foldedlinecount = v:foldend - v:foldstart
    let line = getline(v:foldstart)
    " remove fold mark
    let line = substitute(line, '"\?\s*{{'.'{\s*', '', 'g')
    " remove commend mark
    let line = substitute(line, '^["\#(\*)]\s*', '', '')
    let line = strpart(line, 0, windowwidth - 8 - len(foldedlinecount))
    let showline = " " . line

    let nucolwidth = &foldcolumn + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth
    let fillcharcount = windowwidth - strdisplaywidth(showline) - len(foldedlinecount) -3
    return showline . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction "}}}
set foldtext=MyFoldText()
]]
