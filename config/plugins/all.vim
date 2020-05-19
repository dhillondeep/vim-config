" Plugin Key mappings

if dein#tap('defx.nvim')
	nnoremap <silent> <LocalLeader>e
		\ :<C-u>Defx -toggle `getcwd()` -buffer-name=tab`tabpagenr()`<CR>
	nnoremap <silent> <LocalLeader>a
		\ :<C-u>Defx `getcwd()` -search=`expand('%:p')` -buffer-name=tab`tabpagenr()`<CR>
endif

if dein#tap('fzf.vim')
	nnoremap <silent> <C-a> :History<cr>
	nnoremap <silent> <C-f> :Rg<cr>
	nnoremap <silent> <C-p> :BLines<cr>
	nnoremap <silent> <C-b> :Buffers<cr>
	nnoremap <silent> <C-Space> :Files<cr>
endif

if dein#tap('vista.vim')
	nnoremap <silent> <LocalLeader><LocalLeader> :Vista!!<CR>
	nnoremap <silent> <LocalLeader><LocalLeader>f :Vista finder<CR>
endif

if dein#tap("actionmenu.nvim")
	nnoremap <silent> <C-;> :call ActionMenuCodeActions()<CR>
end

if dein#tap("winresizer")
	nnoremap <silent> <C-e> :WinResizerStartResize<CR>
end

" vim: set ts=2 sw=2 tw=80 noet :
