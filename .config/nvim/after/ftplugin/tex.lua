-- Clear nonessential files when leave Tex file
Au('VimLeave', { pattern = '*.tex',
    command = [[ !latexmk -c % ]] })
