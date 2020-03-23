" ----------------------------------------------------------------------
" | Plugins - Indent Guides                                            |
" ----------------------------------------------------------------------

" Set custom indent colors
" https://github.com/nathanaelkane/vim-indent-guides#setting-custom-indent-colors

let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd
        \ guibg=#00323D
        \ ctermbg=Magenta

autocmd VimEnter,Colorscheme * :hi IndentGuidesEven
        \ guibg=#073642
        \ ctermbg=DarkMagenta


" ----------------------------------------------------------------------
" | Plugins - Markdown                                                 |
" ----------------------------------------------------------------------

" Disable Folding
" https://github.com/plasticboy/vim-markdown#disable-folding

let g:vim_markdown_folding_disabled=1


" ----------------------------------------------------------------------
" | Plugins - NeoComplCache                                            |
" ----------------------------------------------------------------------

" Enable `neocomplcache` by default
" https://github.com/Shougo/neocomplcache.vim#installation

let g:neocomplcache_enable_at_startup=1
let g:neocomplete#enable_fuzzy_completion=1

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Make `<TAB>` autocomplete

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


" ----------------------------------------------------------------------
" | Plugins - Syntastic                                                |
" ----------------------------------------------------------------------

" Inform Syntastic which checkers to use based on file types
" https://github.com/scrooloose/syntastic#3-faq

let g:syntastic_html_checkers = [ 'jshint' ]
let g:syntastic_javascript_checkers = [ 'jshint' ]

" Disable syntax checking by default
let g:syntastic_mode_map = {
    \ 'active_filetypes': [],
    \ 'mode': 'passive',
    \ 'passive_filetypes': []
\}


" ----------------------------------------------------------------------
" | Helper Functions                                                   |
" ----------------------------------------------------------------------

function! GetGitBranchName()

    let branchName = ''

    if exists('g:loaded_fugitive')
        let branchName = '[' . fugitive#head() . ']'
    endif

    return branchName

endfunction

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! StripTrailingWhitespaces()

    " Save last search and cursor position
    let searchHistory = @/
    let cursorLine = line('.')
    let cursorColumn = col('.')

    " Strip trailing whitespaces
    %s/\s\+$//e

    " Restore previous search history and cursor position
    let @/ = searchHistory
    call cursor(cursorLine, cursorColumn)

endfunction

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! ToggleLimits()

    " [51,73]
    "   - git commit message
    "     http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
    " [81]
    "   - general use

    if ( &colorcolumn == '73' )
        set colorcolumn+=51,81
    else
        set colorcolumn-=51,81
    endif

endfunction

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! ToggleRelativeLineNumbers()

    if ( &relativenumber == 1 )
        set number
    else
        set relativenumber
    endif

endfunction


" ----------------------------------------------------------------------
" | Automatic Commands                                                 |
" ----------------------------------------------------------------------

if has('autocmd')

    " Autocommand Groups
    " http://learnvimscriptthehardway.stevelosh.com/chapters/14.html

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Automatically reload the configurations from the
    " `~/.vimrc` and `~/.gvimrc` files whenever they are changed

    augroup auto_reload_vim_configs

        autocmd!
        autocmd BufWritePost vimrc source $MYVIMRC

        if has('gui_running')
            autocmd BufWritePost gvimrc source $MYGVIMRC
        endif

    augroup END

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Automatically strip the trailing whitespaces when files are saved

    augroup strip_trailing_whitespaces

        " List of file types that use the trailing whitespaces:
        "
        "  * Markdown
        "    https://daringfireball.net/projects/markdown/syntax#block

        let excludedFileTypes = [ 'mkd.markdown' ]

        " Only strip the trailing whitespaces if the file type is
        " not in the excluded file types list

        autocmd!
        autocmd BufWritePre * if index(excludedFileTypes, &ft) < 0 | :call StripTrailingWhitespaces()

    augroup END

endif


" ----------------------------------------------------------------------
" | Color Scheme                                                       |
" ----------------------------------------------------------------------

set t_Co=256                   " Enable full-color support

set background=dark            " Use colors that look good
                               " on a dark background

" Set custom configurations for when the
" Solarized theme is used from vim's Terminal mode
" http://ethanschoonover.com/solarized/vim-colors-solarized#advanced-configuration

if !has('gui_running')
    let g:solarized_contrast = 'high'
    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    let g:solarized_visibility = 'high'
endif

