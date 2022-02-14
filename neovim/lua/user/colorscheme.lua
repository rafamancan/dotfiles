vim.cmd([[
try
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_invert_selection = '0'
  colorscheme gruvbox
  highlight ColorColumn ctermbg=0 guibg=grey
  hi SignColumn guibg=none
  hi CursorLineNR guibg=None
  highlight Normal guibg=none
  " highlight LineNr guifg=#ff8659
  " highlight LineNr guifg=#aed75f
  highlight LineNr guifg=#5eacd3
  highlight netrwDir guifg=#5eacd3
  highlight qfFileName guifg=#aed75f
  hi TelescopeBorder guifg=#5eacd
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
