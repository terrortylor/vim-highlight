" Author: terrortylor (https://github.com/terrortylor)
" License: MIT License
" Repository: https://github.com/terrortylor/vim-highlight

if exists('g:hl_loaded')
  finish
endif
let g:hl_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:hl_default_group')
	let g:hl_default_group = 'hlYellow'
endif

if !exists('g:hl_group_config')
	let g:hl_group_config = {}
	let g:hl_group_config['hlGreen'] = 'ctermbg=121 guibg=#60ff60'
	let g:hl_group_config['hlYellow'] = 'ctermfg=0 ctermbg=11'
	let g:hl_group_config['hlGrey'] = 'ctermbg=242 guibg=DarkGrey'
	let g:hl_group_config['hlDarkBlue'] = 'ctermbg=4 guibg=DarkBlue'	
	let g:hl_group_config['hlDarkMage'] = 'ctermbg=5 guibg=DarkMage'
endif

if !exists("g:hl_marked_lines")
	let g:hl_marked_lines = {}
endif

for group in keys(g:hl_group_config)
	execute 'highlight ' . group . ' ' . get(g:hl_group_config, group)
endfor

function! ListGroups(A,L,P)
	return keys(g:hl_group_config)
endfunction

command! -complete=customlist,ListGroups -nargs=? -range HighlightLines <line1>,<line2>call highlight#HighlightLines(<f-args>)
command! -nargs=0 -range RemoveHighlighting <line1>,<line2>call highlight#RemoveHighlighting()

let &cpo = s:save_cpo
unlet s:save_cpo
