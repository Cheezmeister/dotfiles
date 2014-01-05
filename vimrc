"------------------------------------------------------------
" BML Hackery - Here Be Dragons

" --------------------------------------------------------------------------------
"  Dangerous things
" --------------------------------------------------------------------------------

" Because who uses man pages anyway
nnoremap K :filetype detect<CR>
" Because yy the hell not?
nnoremap Y y$
" Because L key said so
nnoremap <space> :w<CR>

" --------------------------------------------------------------------------------
" Misc
" --------------------------------------------------------------------------------
set nowrap " Wrapping is 4 n00bz
set mouse="" " id.
set ttimeout ttimeoutlen=100 " I'm not on dialup
set timeout timeoutlen=400 " Nor the world's fastest typist
set noswapfile " Do u even Git!?

" --------------------------------------------------------------------------------
"  Leader Mappings
" --------------------------------------------------------------------------------

" Misc
nnoremap <leader>t :split .todo<cr>

" Meta
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>r :source $MYVIMRC<cr>

" Pluginery
nnoremap <leader>o :TagbarToggle<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>? :!xdg-open 'http://hea-www.harvard.edu/~fine/Tech/vi.html'<cr>
nnoremap <leader>v :call VimuxRunCommand("")<Left><Left>

" Commenting
vnoremap <leader>cc <C-V>0I// <esc>
vnoremap <leader>cs <C-V>0I# <esc>
vnoremap <leader>cv <C-V>0I" <esc>


" --------------------------------------------------------------------------------
"  AutoCmds
" --------------------------------------------------------------------------------
autocmd BufRead :filetype detect

" Place Swap files here
set directory=~/tmp,/var/tmp,/tmp

" Fire up Pathogen, load plugins
call pathogen#infect()

