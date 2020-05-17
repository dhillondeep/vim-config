execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

" dim inactive window (neovim)
if has('nvim')
    if exists('$TMUX')
        hi ActiveWindow ctermbg=None ctermfg=None guibg=#21242b
        hi InactiveWindow ctermbg=darkgray ctermfg=gray guibg=#282c34
        set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
    endif
endif
