" Use alt + hjkl to resize windows
nnoremap <up>    :resize -2<CR>
nnoremap <down>  :resize +2<CR>
nnoremap <right> :vertical resize -2<CR>
nnoremap <left>  :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" replace word in line
nmap  <leader>rl  :s//g<LEFT><LEFT>
" replace word in file
nmap  <leader>rf  :%s//g<LEFT><LEFT>

" toggle relative number
function! ToggleRelativeLineNumbers()
    if ( &relativenumber == 1 )
        set number
        set norelativenumber
    else
        set nonumber
        set relativenumber
    endif
endfunction

nmap <leader>n :call ToggleRelativeLineNumbers()<CR>

"" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
"" Close buffer
noremap <leader>c :bd<CR>
"" select all
nnoremap <C-A> ggVG

" Alternate way to save
nnoremap <C-s> :w<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev X x
cnoreabbrev X! x!
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Comments
nnoremap <leader>/ :Commentary<cr>

" php
nmap <leader>do :call pdv#DocumentWithSnip()<CR>
