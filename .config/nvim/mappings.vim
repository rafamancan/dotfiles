"open easily vim config
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

"maping the ESC key to jk
inoremap jk <Esc>

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
nnoremap <leader>] :NERDTreeToggle<CR>

"open source tree on current file 
nnoremap <leader>[ :NERDTreeFind<CR>

