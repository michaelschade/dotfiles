" markdown filetype file

if exists("did\_load\_filetypes")
    finish
endif

augroup markdown
    au! BufRead,BufNewFile *.mkd   setfiletype mkd
augroup END

" JSON Syntax Highlighting
" via http://www.vim.org/scripts/script.php?script_id=1945
au! BufRead,BufNewFile *.json set filetype=json
