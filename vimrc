set nocompatible

" allo plugins to be in separated dirs
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set hidden " do not close files but hide them
set nowrap
set number

set hlsearch   " Highlight search matches
hi Search cterm=none ctermbg=4 ctermfg=15 " Blue color for searches

colorscheme vibrantink " Color scheme
set t_Co=256           " terminal supports 256 colors

" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes

filetype on       " Automatically detect file types.
filetype plugin on " This is needed for match plugin to work
if has("autocmd")
  filetype indent on " Autoindentacion
endif

" two spaces for erb indentation
au FileType eruby setl tabstop=2 expandtab
au FileType ruby setl tabstop=2 expandtab

" Allow sending commands to screen window number 2 by typing :Screen ls
command -nargs=+ -complete=file Screen !screen -X at 2 stuff "<args>"
command -complete=file Spfile exec "!screen -X at 2 stuff \"bundle exec spec %\""
command -complete=file Spline exec "!screen -X at 2 stuff \"bundle exec spec %:" . line(".") . "\""

" set ignorecase    " ignore case when searching
" set smartcase     " ignore case if search pattern is all lowercase,
set title " change the terminal's title

set nobackup
set noswapfile

" Force yourself to use jikl
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" Going up and down wrapped lines
nnoremap j gj
nnoremap k gk

" use w!! to write root files
cmap w!! w !sudo tee % >/dev/null

" making other Rails formats to behave like html
" autocmd BufNewFile,BufRead *.addin.erb set filetype=eruby
autocmd BufNewFile,BufRead *.mobile.erb let b:eruby_subtype = 'html'
autocmd BufNewFile,BufRead *.addin.erb let b:eruby_subtype = 'html'

autocmd User Rails Rnavcommand cache app/cache -glob=**/* -suffix=_cache.rb
autocmd User Rails Rnavcommand api app/apis -glob=**/* -suffix=_api.rb -default=application

hi Folded ctermbg=NONE
