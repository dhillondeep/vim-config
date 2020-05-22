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
	nnoremap <silent> <C-s> :BTags<cr>
	nnoremap <silent> <C-g> :GFiles<cr>
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

if dein#tap("deoplete.nvim")
    nnoremap <silent>gd <C-]>
endif

if dein#tap("ale")
	nnoremap <silent> <LocalLeader>[ :ALEPrevious<CR>
	nnoremap <silent> <LocalLeader>] :ALENext<CR>
endif

if dein#tap("vim-fugitive")
	" fugitive git bindings
	nnoremap <Leader>ga :Git add %:p<CR><CR>
	nnoremap <Leader>gs :Gstatus<CR>
	nnoremap <Leader>gc :Gcommit -v -q<CR>
	nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
	nnoremap <Leader>gd :Gdiff<CR>
	nnoremap <Leader>ge :Gedit<CR>
	nnoremap <Leader>gr :Gread<CR>
	nnoremap <Leader>gw :Gwrite<CR><CR>
	nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
	nnoremap <Leader>gp :Ggrep<Space>
	nnoremap <Leader>gm :Gmove<Space>
	nnoremap <Leader>gb :Git branch<Space>
	nnoremap <Leader>go :Git checkout<Space>
	nnoremap <Leader>gps :Dispatch! git push<CR>
	nnoremap <Leader>gpl :Dispatch! git pull<CR>
endif

nmap <LocalLeader>p :call PryLine()<cr>

let s:pry_string = "require 'pry'; binding.pry"
let s:pry_match = "binding.pry"

function! PryLine() abort
	let l:line_text = getline('.')
	let l:pry_match = stridx(l:line_text, s:pry_match)

	echo l:pry_match

	if l:pry_match > 0
		execute 'silent d_'
	else
		execute 'normal O' . s:pry_string
	endif
endfunction

" vim: set ts=2 sw=2 tw=80 noet :
