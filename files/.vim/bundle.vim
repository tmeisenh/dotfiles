set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

 " let Vundle manage Vundle
 " required!
"Bundle 'gmarik/vundle'

filetype plugin indent on     " required!

Bundle 'tpope/vim-vividchalk'
Bundle 'w0ng/vim-hybrid'

" git
" Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" themes
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-markdown'

" pretend ide
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'
Bundle 'ZoomWin'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'sjl/gundo.vim'
Bundle 'tsaleh/vim-align'
Bundle 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,tags
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0 " no cache

Bundle 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
set grepprg=ag\ --nogroup\ --nocolor

Bundle 'scrooloose/nerdcommenter'
Bundle 'cperl82/bufexplorer'
Bundle 'vim-syntastic/syntastic'

" language specific
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'jgdavey/vim-blockle'

Bundle 'timcharper/textile.vim'

Bundle 'moll/vim-node'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'

filetype plugin indent on     " required!
