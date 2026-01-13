" .vimrc
" See https://github.com/tmeisenh/vim

" Deal with unicode characters even if system locale is incorrect
scriptencoding utf8

" plugins expect bash 
set shell=bash

" Turn off any vi compatibility
set nocompatible
set shortmess+=I        " Don't show the Vim welcome screen

let mapleader=","       " Set this early in case other things use it

" load plugins
source $HOME/.vim/plugins.vim

colorscheme hybrid

"Enable syntax highlightning and some nice filetype associations
syntax enable
filetype plugin indent on

" Set console highlights to be readable with black background
set bg=dark

set history=1000        " Remember this many commands

set number              " Display line numbers
set numberwidth=4       " Minimum number of columns to show for line numbers
set ruler               " Always show the cursor position
set showmode            " Always show the mode
set showcmd             " Display incomplete commands
set incsearch           " Do incremental searching (as you type)
set hlsearch            " Highlight the latest search pattern
set laststatus=2        " Always show a status line

set splitright          " Split new vertical windows right of current window

set winminheight=0      " Allow windows to shrink to status line.
set winminwidth=0       " Allow windows to shrink to vertical separator.

set nowrap

set expandtab           " Insert spaces for <Tab> press; use spaces to indent.
set smarttab            " Tab respects 'shiftwidth', 'tabstop', 'softtabstop'.
set tabstop=2           " Set the visible width of tabs.
set softtabstop=2       " Edit as if tabs are 2 characters wide.
set shiftwidth=2        " Number of spaces to use for indent and unindent.
set shiftround          " Round indent to a multiple of 'shiftwidth'.

set wildmode=list:longest,full
set wildmenu

set virtualedit=block

" Care about case only if I use an uppercase letter
set ignorecase
set smartcase

" Set visual bell to nothing
set vb
set t_vb=

" Make buffers less annoying, i.e., 
" keep changed buffers without requiring saves
set hidden

" Act more 'normal' about backspacing
" e.g. to backspace past start of edit
set backspace=indent,eol,start

set whichwrap+=<,>,[,]

" Update the swap file every 20 characters. I don't like to lose stuff.
"
set updatecount=20

" Source other settings from files

" Load custom file type extensions
source $HOME/.vim/myfiletypes.vim

" Load platform specific settings
source $HOME/.vim/platform_setup.vim

" Load key mappings
source $HOME/.vim/key_maps.vim