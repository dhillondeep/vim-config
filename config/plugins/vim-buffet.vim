function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=0 ctermfg=0 guibg=#ffbb7d guifg=#3a3a3b
  hi! BuffetActiveBuffer cterm=NONE ctermbg=0 ctermfg=0 guibg=#3a3a3b guifg=#ffbb7d
  hi! BuffetBuffer cterm=NONE ctermbg=10 ctermfg=8 guibg=#3a3a3b guifg=#ffbb7d
  hi! BuffetTrunc cterm=bold ctermbg=11 ctermfg=8 guibg=#3a3a3b guifg=#ffbb7d
  hi! BuffetTab cterm=NONE ctermbg=0 ctermfg=0 guibg=#ffbb7d guifg=#3a3a3b

  hi! link BuffetModCurrentBuffer BuffetCurrentBuffer
  hi! link BuffetModActiveBuffer BuffetActiveBuffer
  hi! link BuffetModBuffer BuffetBuffer
endfunction
