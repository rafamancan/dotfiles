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

" files search
" git files
nnoremap <C-p> :GFiles<CR>
" recents
nnoremap <C-e> :History<CR>
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
cnoreabbrev X x
cnoreabbrev X! x!
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <tab> <Plug>(coc-snippets-expand-jump)

" Ctrl + F to find file
nmap <C-F> <Plug>CtrlSFPrompt

" Comments
nnoremap <leader>/ :Commentary<cr>
