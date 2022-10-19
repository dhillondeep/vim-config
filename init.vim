execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

if exists('g:vscode')
    " VSCode extension
else
    " dim inactive window (neovim)
    if exists('$TMUX')
        hi ActiveWindow ctermbg=None ctermfg=None guibg=#21242b
        hi InactiveWindow ctermbg=darkgray ctermfg=gray guibg=#282c34
        set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
    endif
endif
