"to map CAPS to be both CTRL and ESC read this: https://medium.com/@pechyonkin/how-to-map-capslock-to-control-and-escape-on-mac-60523a64022b

"open easily vim config
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

"mode between split windows easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"maping buffer split
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>x :split<CR>

" switch between current and last buffer
nnoremap <leader>. <c-^>

"files search
nnoremap <leader>p :GFiles<CR>

"text search inside files
nnoremap <leader>f :Rg<CR>

"open source tree
nnoremap <silent> <A-2> :NERDTreeToggle<CR>

"open source tree on current file 
nnoremap <silent> <A-1> :NERDTreeFind<CR>

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