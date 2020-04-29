function! airline#extensions#tabline#formatters#custom_dir_filename#format(bufnr, buffers)
  let name = bufname(a:bufnr)
  return  fnamemodify(name, ':p:h:t') . '/' . fnamemodify(name, ':t')
endfunction
