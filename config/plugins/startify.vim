" Startify (https://github.com/mhinz/vim-startify)
" ------------------------------------------------
let g:loaded_devicons = 1

" compatibility with vim-devicons, so VimScript-only plugins can check if the
" function exists and don't care if it comes from vim-devicons or this plugin
function! WebDevIconsGetFileTypeSymbol(name, ext = "")
    if empty(a:ext)
        let l:extension = getbufvar(a:name, "&filetype", "")
    else
        let l:extension = a:ext
    endif

    let l:icon = luaeval("require('nvim-web-devicons').get_icon(\""..a:name.."\", \""..l:extension.."\")")
    if l:icon == "null"
        return ""
    else
        return l:icon
    endif
endfunction

function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" 'Most Recent Files' number
let g:startify_files_number           = 18

" Update session automatically as you exit vim
let g:startify_session_persistence    = 1

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Saved Sessions']       },
          \ { 'type': 'dir',       'header': ['   Recent Files' ] },
          \ ]

" save current session
nnoremap <leader>ss :SSave<CR>

" list sessions / switch to different project
nnoremap <leader>sl :SClose<CR>
