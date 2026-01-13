"
" Key Mappings
"

"
" Map j/k combos to get out of insert mode and turn off search highlighting
inoremap jk <ESC>:noh<CR>
inoremap kj <ESC>:noh<CR>
inoremap jj <ESC>:noh<CR>
inoremap kk <ESC>:noh<CR>

" Tab/Shift+Tab indent/unindent the highlighted block (and maintain the
" highlight after changing the indentation). Works for both Visual and Select
" modes.
"
vmap >  >gv
vmap <  <gv

" Center the display line after searches. (This makes it *much* easier to see
" the matched line.)
"
" More info: http://www.vim.org/tips/tip.php?tip_id=528
"
nnoremap n   nzz
nnoremap N   Nzz
nnoremap *   *zz
nnoremap #   #zz
nnoremap g*  g*zz
nnoremap g#  g#zz
" Turn On/Off NERDTree
map <leader>n :NERDTreeToggle<CR>

" CtrlP maps
map <leader>t :CtrlP<CR>
map <leader>p :CtrlPMixed<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>m :CtrlPMRU<CR>

" Get rid of the distracting search highlighting easily
nnoremap <leader><space> :noh<cr>

" Use tab to move between matching pairs. Much easier to hit than %
nmap <tab> %
vmap <tab> %

" Move up and down by screen lines all the time
nnoremap j gj
nnoremap k gk

" Strip all the trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Make it easier to invoke ack for searching
nnoremap <leader>a :Ack<SPACE>

" Reselect last pasted text. Makes it easy to adjust indention, etc
nnoremap <leader>v V`]

" Make dot operator work in visual mode
xnoremap . :normal .<CR>
