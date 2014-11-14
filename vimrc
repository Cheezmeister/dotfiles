"------------------------------------------------------------
" BML Hackery - Here Be Dragons
"------------------------------------------------------------

" --------------------------------------------------------------------------------
"  Dangerous things
" --------------------------------------------------------------------------------

" Because pasting hurts my poor fingers otherwise
inoremap <C-R><C-R> <C-R>"

" Because yy the hell not?
nnoremap Y y$

" Because J key said so (and 0 concurs)
nnoremap <CR> :

" Because PCRE Master Race
nnoremap g/ /\v

" Because I'm a horrible person
cabbrev w!! w !sudo tee > /dev/null %

" --------------------------------------------------------------------------------
" Options
" --------------------------------------------------------------------------------
set cursorline cursorcolumn
set nowrap
set mouse=""
set noswapfile " Do u even Git!?
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set incsearch
set hlsearch
set cursorline
set hidden
set autoindent cindent smartindent
set smarttab expandtab
set shiftwidth=2 tabstop=2
set encoding=utf-8 " I'm a civilized human
set ttimeout ttimeoutlen=20 " I'm not on dialup
set timeout timeoutlen=400 " Nor the world's fastest typist
set scrolloff=4 " Leave 4 lines of context

" --------------------------------------------------------------------------------
" Rainbow Stylin'
" --------------------------------------------------------------------------------
highlight CursorLine   cterm=none ctermbg=black
highlight CursorColumn cterm=none ctermbg=black

" --------------------------------------------------------------------------------
"  Leader Mappings
" --------------------------------------------------------------------------------
let mapleader = "\\"
let maplocalleader = "\<space>"

" R/W
nnoremap <localleader>q :q<CR>
nnoremap <localleader>x :x<CR>
nnoremap <localleader>w :w<CR>
nnoremap <localleader>e :e<CR>

" Misc
nnoremap <leader>tt :split .todo<cr>
nnoremap <leader>S $zf%
nnoremap <leader>mr :let @a=@"<cr>

" Meta
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>r :source $MYVIMRC<cr>
vnoremap <leader>x "xy@x<cr>

" Pluginery
nnoremap <leader>v :call VimuxRunCommand("")<Left><Left>
nnoremap <leader>b :wa<cr>:call VimuxRunLastCommand()<cr>

" Toggling things
nnoremap <leader>tn :NERDTreeToggle<cr>
nnoremap <leader>to :TagbarToggle<cr>
nnoremap <leader>tl :set relativenumber!<cr>
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

