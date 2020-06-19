" File Types
" ===

augroup user_plugin_filetype " {{{
	autocmd!

	" Reload vim config automatically
	autocmd BufWritePost $VIM_PATH/{*.vim,*.yaml,vimrc} nested
		\ source $MYVIMRC | redraw

	" Highlight current line only on focused window
	autocmd WinEnter,InsertLeave * if &ft !~# '^\(denite\|clap_\)' |
		\ set cursorline | endif
	autocmd WinLeave,InsertEnter * if &ft !~# '^\(denite\|clap_\)' |
		\ set nocursorline | endif

	" Automatically set read-only for files being edited elsewhere
	autocmd SwapExists * nested let v:swapchoice = 'o'

	" Equalize window dimensions when resizing vim window
	autocmd VimResized * tabdo wincmd =

	" Check if file changed when its window is focus, more eager than 'autoread'
	autocmd FocusGained * checktime

	autocmd Syntax * if line('$') > 5000 | syntax sync minlines=200 | endif

	" Update filetype on save if empty
	autocmd BufWritePost * nested
		\ if &l:filetype ==# '' || exists('b:ftdetect')
		\ |   unlet! b:ftdetect
		\ |   filetype detect
		\ | endif

	" Reload Vim script automatically if setlocal autoread
	autocmd BufWritePost,FileWritePost *.vim nested
		\ if &l:autoread > 0 | source <afile> |
		\   echo 'source ' . bufname('%') |
		\ endif

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	autocmd BufReadPost *
		\ if &ft !~# 'commit' && ! &diff &&
		\      line("'\"") >= 1 && line("'\"") <= line("$")
		\|   execute 'normal! g`"zvzz'
		\| endif

	autocmd FileType crontab setlocal nobackup nowritebackup

	autocmd FileType yaml,docker-compose setlocal expandtab

	autocmd FileType gitcommit setlocal spell

	autocmd FileType gitcommit,qfreplace setlocal nofoldenable

	" https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
	autocmd FileType css,javascript,javascriptreact setlocal backupcopy=yes

	autocmd FileType python
		\ setlocal expandtab smarttab nosmartindent
		\ | setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80

	autocmd FileType html setlocal path+=./;/

	autocmd FileType markdown
		\ setlocal expandtab spell conceallevel=0
		\ | setlocal autoindent formatoptions=tcroqn2 comments=n:>

augroup END " }}}
