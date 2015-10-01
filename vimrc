"------------------------------------------------------------
" BML Hackery - Here Be Dragons
"------------------------------------------------------------

" --------------------------------------------------------------------------------
"  Dangerous things
"  (These override default behaviour)
" --------------------------------------------------------------------------------

" Because yy the hell not?
nnoremap Y y$

" Because J key said so (and 0 concurs)
nnoremap <CR> :

" Because J key said so again!
cabbrev j jumps

" Because PCRE Master Race
nnoremap g/ /\v

" Because Tab key wants to feel useful
nnoremap - <C-O>

" --------------------------------------------------------------------------------
"  Less Dangerous things
" --------------------------------------------------------------------------------

" Because pasting hurts my poor fingers otherwise
inoremap <C-R>' <C-R>"
cnoremap <C-R>' <C-R>"
inoremap <C-R>; <C-R>:
cnoremap <C-R>; <C-R>:

" Because I'm a horrible person
cabbrev w!! w !sudo tee > /dev/null %

" Because splits yo
cabbrev vsb vs \| b

" Because sometimes it's all about the code
nnoremap <BS> :call VimuxCloseRunner() \| NERDTreeClose \| TagbarClose<CR>

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
set autoread

" --------------------------------------------------------------------------------
" Rainbow Stylin'
" --------------------------------------------------------------------------------
highlight CursorLine   cterm=none ctermbg=black
highlight CursorColumn cterm=none ctermbg=black

" --------------------------------------------------------------------------------
"  Leader Mappings
" --------------------------------------------------------------------------------
let mapleader = "\<space>"
let maplocalleader = "\\"

" R/W
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :e<CR>
nnoremap <leader>a :mksession!<CR>:xa<CR>

" Meta
nnoremap <leader>me :edit $MYVIMRC<cr>
nnoremap <leader>mr :source $MYVIMRC<cr>
vnoremap <leader>mx "xy@x<cr>

" Pluginery
nnoremap <leader>v :call VimuxRunCommand("")<Left><Left>
nnoremap <leader>b :wa<cr>:call VimuxRunLastCommand()<cr>

" Todo lists
nnoremap <leader>lt :split ~/.todo<cr>
nnoremap <leader>ll :split .todo<cr>

" Toggling things
nnoremap <leader>tn :NERDTreeToggle<cr>
nnoremap <leader>to :TagbarToggle<cr>
nnoremap <leader>tr :RainbowParenthesesToggle<cr>
nnoremap <leader>tl :set relativenumber!<cr>
nnoremap <leader>tp :set paste!<cr>
nnoremap <leader>tw :set wrap!<cr>

" Miscellany
nnoremap <Leader>] :tag<space>


" --------------------------------------------------------------------------------
"  Misc
" --------------------------------------------------------------------------------

" Place Swap files here
set directory=~/tmp,/var/tmp,/tmp

" Fire up Pathogen, load plugins
call pathogen#infect()

