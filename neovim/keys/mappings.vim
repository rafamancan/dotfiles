" Better nav for omnicomplete
inoremap <expr> \<TAB> ("\<TAB>")
inoremap <expr> <S-TAB> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da


"open source tree
nnoremap <silent> <leader>e :CocCommand explorer<CR>
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
nmap <leader>do :call pdv#DocumentWithSnip()<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>
"" Close buffer
noremap <leader>c :bd<CR>
"" select all
nnoremap <C-A> ggVG
" Alternate way to save
nnoremap <C-s> :w<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv
" files search
nnoremap <C-p> :GFiles<CR>

" format with prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
