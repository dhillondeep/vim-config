" Plugin Key mappings
"
if dein#tap('nvim-tree.lua')
	nnoremap <silent> <LocalLeader>a
		\ :<C-u>NvimTreeFindFileToggle<CR>
endif

if dein#tap('fzf-lua')
	nnoremap <silent> <leader>o :FzfLua live_grep_native<cr>
	nnoremap <silent> <leader>ff :FzfLua files<cr>
	nnoremap <silent> <leader>fg :FzfLua git_files<cr>
	nnoremap <silent> <leader>fl :FzfLua lines<cr>
	nnoremap <silent> <leader>fb :FzfLua blines<cr>
	nnoremap <silent> <leader>fs :FzfLua lsp_document_symbols<cr>
	nnoremap <silent> <leader>fd :FzfLua lsp_document_diagnostics<cr>
endif

if dein#tap('lspsaga.nvim')
	nnoremap <silent> <LocalLeader>f :LspZeroFormat<cr>
endif

if dein#tap("winresizer")
	nnoremap <silent> <C-e> :WinResizerStartResize<CR>
endif

if dein#tap("vim-signify")
	nnoremap <leader>gj <plug>(signify-next-hunk)
	nnoremap <leader>gk <plug>(signify-prev-hunk)
	nnoremap <LocalLeader>gt ::SignifyToggle<CR>
endif
