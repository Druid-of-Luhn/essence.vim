" File:         essence.vim
" Author:       Billy Brown
" Description:  Filetype detection of the Essence and Essence' modelling languages.
" Version:      1.1

autocmd BufNewFile,BufRead *.essence,*.eprime,*.param,*.rule,*.repr,*.essence.out,*.essence.log,*.essence.err,*.solution set filetype=essence
autocmd BufRead * call s:Essence()

function! s:Essence()
    if !empty(&filetype)
        return
    endif
    " Recognise files beginning with "language Essence...' or 'language ESSENCE...'
    let line = getline(1)
    if line =~ "^language \(Essence\|ESSENCE\).*$"
        setfiletype essence
    endif
endfunction
