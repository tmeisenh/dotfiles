"
" Commands
"

" View differences between the current buffer and the original file.
" (Based on code from $VIMRUNTIME/vimrc_example.vim.)
"
if !exists(":DiffOrig")
    command DiffOrig vertical new | set buftype=nofile | read # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" Close current buffer without closing window.
"
command! Bd enew<Bar>bd #

cabbrev Q quit
cabbrev W write
cabbrev Wq wq
cabbrev WQ wq

" use goimports for formatting
" let g:go_fmt_command = "goimports"
"
" " turn highlighting on
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
"
" let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
"
