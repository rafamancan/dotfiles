let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]

let g:startify_bookmarks = [
            \ { 'g': '~/workspace/services/manager-fenix' },
            \ { 'n': '~/workspace/services/node-fenix' },
            \ { 'c': '~/workspace/services/chat-fenix' },
            \ { 'a': '~/workspace/services/app-fenix' },
            \ { 'u': '~/workspace/services/ui-toolkit' },
            \ { 'z': '~/.zshrc' },
            \ ]
