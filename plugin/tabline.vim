" Tabline
" ---

function! Tabline()
	hi User1 ctermfg=0 ctermbg=0 guibg=#ffbb7d guifg=#000000
	" Active project name
	let s:tabline =
		\ '%1* %{badge#project()} %* '

	" Iterate through all tabs and collect labels
	let l:current = tabpagenr()
	for i in range(tabpagenr('$'))
		let l:nr = i + 1
		if l:nr == l:current
			" Active tab
			let s:tabline .=
				\ '%1* %' . l:nr . 'T%{badge#filename(0, ' . l:nr . ', 1, 1)} %*' .
				\ ' '
		else
			" Normal tab
			let s:tabline .=
				\ ' %' . l:nr . 'T%{badge#filename(0, ' . l:nr . ', 1, 1)}' .
				\ ' '
		endif
	endfor

	return s:tabline
endfunction

let &tabline='%!Tabline()'

" vim: set ts=2 sw=2 tw=80 noet :
