" Vista (https://github.com/liuchengxu/vista.vim)
" -----------------------------------------------

let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_disable_statusline = 1

" close buffer if it is the last one left
augroup user_plugin_vista
    autocmd!
    autocmd WinEnter * if &filetype == 'vista' && winnr('$') == 1 | bdel | endif
augroup END
