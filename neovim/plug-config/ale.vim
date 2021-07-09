" disable linting while typing
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=0
let g:ale_list_window_size = 1
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_php_phpcs_standard='phpcs.xml.dist'
let g:ale_php_phpmd_ruleset='phpmd.xml'
let g:ale_fixers = {
  \ '*': ['trim_whitespace'],
  \ 'php': ['phpcbf', 'remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \}
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'php': ['phpcbf'],
  \}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['E:%s', 'W:%s', 'OK']

highlight ALEErrorSign ctermbg=NONE ctermfg=darkred
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEError cterm=undercurl ctermfg=none
highlight ALEWarning cterm=undercurl ctermfg=none
