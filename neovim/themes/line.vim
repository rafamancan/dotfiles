" AIRLINE
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#formatter = 'short_path'

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='gruvbox'

" Always show tabs
set showtabline=2
"
"
" LIGHTLINE

" We don't need to see things like -- INSERT -- anymore
" set noshowmode
" let g:lightline = {
"       \ 'colorscheme': 'powerline',
"       \ 'component_function': {
"       \   'filename': 'LightlineFilename',
"       \ }
"       \ }

" function! LightlineFilename()
"   let root = fnamemodify(get(b:, 'git_dir'), ':h')
"   let path = expand('%:p')
"   if path[:len(root)-1] ==# root
"     return path[len(root)+1:]
"   endif
"   return expand('%')
" endfunction

" set laststatus=2
