# vim-highlight

Adds ability to highlight lines or a visual selection.
Highlighting can be turned on and off, and a number of stylings can be configured.

This was entirely written on a terminal emulator on my phone in the middle of
various nights where my child refused to sleep without being held. I can
testify that this does not offer a great vim experience 🤪.
The https://stackoverflow.com/questions/60511223/is-it-possible-to-visibly-mark-lines-of-a-file-in-vim-without-altering-the-file

# Commands

*:HighlightLines {args}* - Highlights either the current line or the lines in a visual selection. If no argument is passed then the g:hl_default_group group is used.

 *:RemoveHighlighting* - Removes highlighting on current line it the lines in a visual selection.

# Configure

*g:hl_default_group* - The default highlighting group to use when not passed as command argument.

*g:hl_group_config* - A map of highlighting group names, and the settings to apply.

An example entry would be:

```
let g:hl_group_config['hlYellow'] = 'ctermfg=0 ctermbg=11'
```

# Example mappings

The following are some suggested mappings:
    
```
nnoremap <leader>h1 :HighlightLine<cr>
vnoremap <leader>h1 :'<,'>HighlightLine<cr>
nnoremap <leader>h2 :HighlightLine hlDarkMage<cr>
vnoremap <leader>h2 :'<,'>HighlightLine hlDarkMage<cr>
nnoremap <leader>h3 :HighlightLine hlGreen<cr>
vnoremap <leader>h3 :'<,'>HighlightLine hlGreen<cr>
nnoremap <leader>h4 :HighlightLine hlYellow<cr>
vnoremap <leader>h4 :'<,'>HighlightLine hlYellow<cr>
nnoremap <leader>h5 :HighlightLine hlGrey<cr>
vnoremap <leader>h5 :'<,'>HighlightLine hlGrey<cr>
nnoremap <leader>h6 :HighlightLine hlDarkBlue<cr>
vnoremap <leader>h6 :'<,'>HighlightLine hlDarkBlue<cr>
nnoremap <leader>rh :RemoveHighlighting<cr>
vnoremap <leader>rh :'<,'>RemoveHighlighting<cr>
```
