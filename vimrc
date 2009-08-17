set nocompatible  " We don't want vi compatibility.
filetype on       " Automatically detect file types.

filetype plugin on " This is needed for match plugin to work

set cursorline " Linea de cursor
set number     " Show line numbers
set hlsearch   " Highlight search matches


if has("autocmd")
  filetype indent on " Autoindentacion
endif

" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes

" Use Ctrl+prev/next to browse tabs
map [5^ gT
map [6^ gt

colorscheme vibrantink " Color scheme
set t_Co=256           " terminal supports 256 colors
set nu
set sts=2
set sw=2

hi Search cterm=none ctermbg=4 ctermfg=15 " Blue color for searches

