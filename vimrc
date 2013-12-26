"------------------------------------------------------------
" BML Hackery - Here Be Dragons

" --------------------------------------------------------------------------------
"  Dangerous things
" --------------------------------------------------------------------------------

" Because who uses man pages anyway
map K :filetype detect<CR>
map <space> :w<CR>

" --------------------------------------------------------------------------------
" Misc
" --------------------------------------------------------------------------------
set nowrap " Wrapping is 4 n00bz
set mouse=""
set timeoutlen=300 
set noswapfile " Do u even Git!?

" --------------------------------------------------------------------------------
"  Leader Mappings
" --------------------------------------------------------------------------------
" All the cool kids use comma. Not this punk.
let mapleader = "\\"

" Meta
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>r :source $MYVIMRC<cr>
nnoremap <leader>t :split .todo<cr>

nnoremap <leader>o :TagbarToggle<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>? :!xdg-open 'http://hea-www.harvard.edu/~fine/Tech/vi.html'<cr>

" Commenting
vnoremap <leader>c <C-V>0I


" --------------------------------------------------------------------------------
"  AutoCmds
" --------------------------------------------------------------------------------
autocmd BufRead :filetype detect

" Place Swap files here
set directory=~/tmp,/var/tmp,/tmp

" Fire up Pathogen, load plugins
call pathogen#infect()

