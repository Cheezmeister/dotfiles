"------------------------------------------------------------
" BML Hackery - Here Be Dragons

" --------------------------------------------------------------------------------
"  Dangerous things
" --------------------------------------------------------------------------------

" Because pasting hurts my poor fingers otherwise
inoremap <C-R><C-R> <C-R>"
" Because yy the hell not?
nnoremap Y y$
" Because L key said so
nnoremap <space>q :q<CR>
nnoremap <space>x :x<CR>
nnoremap <space>w :w<CR>
nnoremap <space>e :e<CR>
" Because J key said so (and 0 concurs)
nnoremap <CR> :

" Because I'm a horrible person
cnoremap w!! w !sudo tee > /dev/null %

" --------------------------------------------------------------------------------
"  Tweaks
" --------------------------------------------------------------------------------

" Leave 4 lines of context
nnoremap z<CR> z<CR>4<C-Y>
nnoremap zb zb4<C-E>

" --------------------------------------------------------------------------------
" Options
" --------------------------------------------------------------------------------
set cursorline
set nowrap " Wrapping is 4 n00bz
set mouse="" " id.
set ttimeout ttimeoutlen=100 " I'm not on dialup
set timeout timeoutlen=400 " Nor the world's fastest typist
set noswapfile " Do u even Git!?
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set incsearch
set cursorline
set hidden
set autoindent smartindent tabstop=2

" --------------------------------------------------------------------------------
"  Leader Mappings
" --------------------------------------------------------------------------------
let mapleader = "\\"
let maplocalleader = "="

" Misc
nnoremap <leader>tt :split .todo<cr>
nnoremap <leader>S $zf%

" Meta
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>r :source $MYVIMRC<cr>

" Pluginery
nnoremap <leader>v :call VimuxRunCommand("")<Left><Left>
nnoremap <leader>b :wa<cr>:call VimuxRunLastCommand()<cr>

" Shell commands
nmap <leader>sc <leader>vctags -R .<cr>
nmap <leader>sm <leader>vmake<cr>

" Toggling things
nnoremap <leader>tn :NERDTreeToggle<cr>
nnoremap <leader>to :TagbarToggle<cr>
nnoremap <leader>tl :set number!<cr>
nnoremap <leader>tp :set paste!<cr>
nnoremap <leader>tw :set wrap!<cr>

" --------------------------------------------------------------------------------
"  AutoCmds
" --------------------------------------------------------------------------------
autocmd BufRead :filetype detect

" Place Swap files here
set directory=~/tmp,/var/tmp,/tmp

" Fire up Pathogen, load plugins
call pathogen#infect()

