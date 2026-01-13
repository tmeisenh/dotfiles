" vim-plug plugin manager
" Run :PlugInstall to install, :PlugUpdate to update

call plug#begin('~/.vim/plugged')

" colorscheme
Plug 'w0ng/vim-hybrid'

" tmux integration
Plug 'christoomey/vim-tmux-navigator'

" file/buffer navigation
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,tags
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
set grepprg=ag\ --nogroup\ --nocolor

Plug 'cperl82/bufexplorer'

" editing helpers
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'sjl/gundo.vim'

" syntax
Plug 'tpope/vim-markdown'

call plug#end()
