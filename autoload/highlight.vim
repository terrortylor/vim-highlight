" Author: terrortylor (https://github.com/terrortylor)
" License: MIT License
" Repository: https://github.com/terrortylor/vim-highlight

if exists('g:hl_autoloaded')
  finish
endif
let g:hl_autoloaded = 1

let s:save_cpo = &cpo
set cpo&vim

function! highlight#HighlightLines(...) range
	if a:0 == 1
		let l:group = a:1
	else
		let l:group = g:hl_default_group
	endif

	let l:lines = getline(a:firstline, a:lastline)
	for line in l:lines
		call s:AddLineToMatchGroup(l:group, '^' . line)
	endfor
endfunction

function! highlight#RemoveHighlighting() range
	let l:lines = getline(a:firstline, a:lastline)
	for line in l:lines
		call s:DeleteLineToMatchGroup('^' . line)
	endfor
endfunction

function! s:AddLineToMatchGroup(group, line) abort
	if !has_key(g:hl_group_config, a:group)
		echo 'error: group ' . a:group . ' not found'
		return
	endif
	" if line is just whitespace ignore
	if a:line =~ '^\s*$'
		return
	endif
	if has_key(g:hl_marked_lines, a:line)
		echo 'error: line is already highlighted'
	endif
	let l:id = matchadd(a:group, a:line)
	let g:hl_marked_lines[a:line] = l:id
	return
endfunction

function! s:DeleteLineToMatchGroup(line) abort
	let l:id = get(g:hl_marked_lines, a:line)
	if l:id > 0
		call matchdelete(l:id)
		unlet g:hl_marked_lines[a:line]
	else
		echo 'info: not highlighted'
	endif
	return
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
