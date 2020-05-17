" ripgrep settings
let rg_fmt = 'rg --column --line-number --no-heading --color=always --fixed-strings --ignore-case --hidden --follow '

" uses fzf and ripgrep to perfom search
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   rg_fmt.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" uses ripgrep to perform search and allows the ability to provide arguments
function! RipgrepFzf(query, fullscreen, command_format)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --fixed-strings --ignore-case --hidden --follow %s'
    let initial_command = printf(command_fmt, a:query)
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rgrep call RipgrepFzf(<q-args>, <bang>0, rg_fmt)

" fzf settings
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(&lines*0.8)
  let width = float2nr(&columns*0.6)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = float2nr(&lines*0.1)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
