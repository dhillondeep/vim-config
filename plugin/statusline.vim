" Active statusline
let s:stl =   '%1* %{StatuslineMode()} %*'
let s:stl .=   ' '
let s:stl .=   '%( %{badge#branch()} %)'
let s:stl .=   '%f '
let s:stl .=   "%(%{badge#modified('+')} %)"
let s:stl .=   '%(%{badge#indexing()} %)'
let s:stl .=   '%='
let s:stl .=   '%<'
let s:stl .=   '%(%{CocStatus()}｜%)'
let s:stl .=   "%{&readonly ? '🔒｜' : ''}"
let s:stl .=   '%(%{badge#format()}｜%)'
let s:stl .=   '%(%{&fenc}｜%)'
let s:stl .=   '%(%{&ft}｜%)'
let s:stl .=   '%1*%(%5.l:%-3.c%3.p%% %)%*'

" Non Active statusline
let s:stl_nc  =   "%{&readonly ? ' 🔒｜' : ' '}"
let s:stl_nc .=   '%{badge#filename()}'
let s:stl_nc .=   '%='
let s:stl_nc .=   '%(%{&ft} %)'

let s:disable_statusline =
	\ 'defx\|denite\|vista\|tagbar\|undotree\|diff\|peekaboo\|sidemenu'

function! s:active()
	hi User1 ctermfg=0 ctermbg=0 guibg=#98c379 guifg=#000000

	if &filetype ==# 'defx'
		let &l:statusline = '%y %= %l/%L'
	elseif &filetype ==# 'vista'
		let &l:statusline = '%y %= %l/%L'
	elseif &filetype !~# s:disable_statusline
		let &l:statusline = s:stl
	endif
endfunction

function! s:inactive()
	hi User1 ctermfg=0 ctermbg=0 guibg=#98c379 guifg=#000000

	if &filetype ==# 'defx'
		let &l:statusline = '%y %= %l/%L'
	elseif &filetype ==# 'vista'
		let &l:statusline = '%y %= %l/%L'
	elseif &filetype !~# s:disable_statusline
		let &l:statusline = s:stl_nc
	endif
endfunction

augroup user_statusline
	autocmd!

	" Set active/inactive statusline templates
	autocmd VimEnter,ColorScheme,FileType,WinEnter,BufWinEnter * call s:active()
	autocmd WinLeave * call s:inactive()

	" Redraw on Vim events
	autocmd FileChangedShellPost,BufFilePost,BufNewFile,BufWritePost * redrawstatus

	" Redraw on Plugins custom events
	autocmd User CocStatusChange,CocGitStatusChange redrawstatus
	autocmd User CocDiagnosticChange redrawstatus
augroup EN


function! CocStatus() abort
	if exists('*coc#status')
		let l:cocstatus = coc#status()
		return l:cocstatus
	endif
	return ''
endfunction

let g:currentmode={
    \ 'n'      : 'NORMAL',
    \ 'no'     : 'N·OPERATON PENDING',
    \ 'v'      : 'VISUAL',
    \ 'V'      : 'V·LINE',
    \ '\<C-V>' : 'V·BLOCK',
    \ 's'      : 'SELECT',
    \ 'S'      : 'S·LINE',
    \ '\<C-S>' : 'S·BLOCK',
    \ 'i'      : 'INSERT',
    \ 'R'      : 'REPLACE',
    \ 'Rv'     : 'V·REPLACE',
    \ 'c'      : 'COMMAND',
    \ 'cv'     : 'VIM EX',
    \ 'ce'     : 'EX',
    \ 'r'      : 'PROMPT',
    \ 'rm'     : 'MORE',
    \ 'r?'     : 'CONFIRM',
    \ '!'      : 'SHELL',
    \ 't'      : 'TERMINAL'
    \}


function! StatuslineMode()
	let l:mode = mode()
	let l:modeval = get(g:currentmode, l:mode, '')
  return l:modeval
endfunction

"" vim: set ts=2 sw=2 tw=80 noet :
