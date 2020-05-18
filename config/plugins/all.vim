" Plugin Key mappings

if dein#tap('defx.nvim')
	nnoremap <silent> <LocalLeader>e
		\ :<C-u>Defx -toggle `getcwd()` -buffer-name=tab`tabpagenr()`<CR>
	nnoremap <silent> <LocalLeader>a
		\ :<C-u>Defx `getcwd()` -search=`expand('%:p')` -buffer-name=tab`tabpagenr()`<CR>
endif

if dein#tap('vim-sidemenu')
	nmap <Leader>l <Plug>(sidemenu)
	xmap <Leader>l <Plug>(sidemenu-visual)
endif


if dein#tap('vim-gitgutter')
	nmap ]g <Plug>(GitGutterNextHunk)
	nmap [g <Plug>(GitGutterPrevHunk)
	nmap gs <Plug>(GitGutterPreviewHunk)
endif

if dein#tap('fzf.vim')
	nnoremap <silent> <C-a> :History<cr>
	nnoremap <silent> <C-f> :Rg<cr>
	nnoremap <silent> <C-p> :BLines<cr>
	nnoremap <silent> <C-b> :Buffers<cr>
	nnoremap <silent> <C-Space> :Files<cr>
endif

if dein#tap('vista.vim')
	nnoremap <silent> <LocalLeader>a :Vista!!<CR>
endif

if dein#tap("actionmenu.nvim")
	nnoremap <silent> <LocalLeader>s :call ActionMenuCodeActions()<CR>
end


" vim: set ts=2 sw=2 tw=80 noet :
