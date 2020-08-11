let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]

let g:startify_bookmarks = [
            \ { 'a': '~/workspace/liuv/area-estabelecimento' },
            \ { 'i': '~/workspace/liuv/api' },
            \ { 'p': '~/workspace/liuv/app' },
            \ { 's': '~/workspace/liuv/app-estabelecimento' },
            \ { 'c': '~/workspace/liuv/cardapio-digital' },
            \ { 'z': '~/.zshrc' },
            \ ]
