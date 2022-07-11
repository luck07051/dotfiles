vim.cmd [[
    try
        colorscheme ui_colors
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        set background=dark
        echo "colorscheme not found!"
    endtry
]]
