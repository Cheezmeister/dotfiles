"------------------------------------------------------------
" BML Hackery - Here Be Dragons

" --------------------------------------------------------------------------------
"  Dangerous things
" --------------------------------------------------------------------------------

" Because pasting hurts my poor fingers otherwise
inoremap <C-R><C-R> <C-R>"
" Because who uses man pages anyway
nnoremap K :filetype detect<CR>
" Because yy the hell not?
nnoremap Y y$
" Because L key said so
nnoremap <space>q :q<CR>
nnoremap <space>x :x<CR>
nnoremap <space>w :w<CR>
nnoremap <space>e :e<CR>
" Because H key said so
nnoremap <BS> :

" Because I'm a horrible person
cnoremap w!! w !sudo tee > /dev/null %

" --------------------------------------------------------------------------------
"  Tweaks
" --------------------------------------------------------------------------------

" Leave 4 lines of context
nnoremap z<CR> z<CR>4<C-Y>
nnoremap zb zb4<C-E>

" --------------------------------------------------------------------------------
" Misc
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

" --------------------------------------------------------------------------------
"  Leader Mappings
" --------------------------------------------------------------------------------

" Misc
nnoremap <leader>tt :split .todo<cr>

" Meta
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>r :source $MYVIMRC<cr>

" Pluginery
nnoremap <leader>? :!open 'http://hea-www.harvard.edu/~fine/Tech/vi.html'<cr>
nnoremap <leader>v :call VimuxRunCommand("")<Left><Left>
nnoremap <leader>b :wa<cr>:call VimuxRunLastCommand()<cr>

" Windows
nnoremap <leader>wv :vsplit<cr>
nnoremap <leader>ws :split<cr>

" Shell commands
nmap <leader>sc <leader>vctags -R .<cr>
nmap <leader>sm <leader>vmake<cr>

" Commenting - C-Family; Scripting languages; Vim
nnoremap <leader>cc 0i// <esc>
nnoremap <leader>cs 0i# <esc>
nnoremap <leader>cv 0i" <esc>
vnoremap <leader>cc <C-V>0I// <esc>
vnoremap <leader>cs <C-V>0I# <esc>
vnoremap <leader>cv <C-V>0I" <esc>

" Toggling things
nnoremap <leader>tn :NERDTreeToggle<cr>
nnoremap <leader>to :TagbarToggle<cr>
nnoremap <leader>tl :set number!<cr>
nnoremap <leader>tp :set paste!<cr>
nnoremap <leader>tw :set wrap!<cr>
nmap <leader>ta <leader>tn <leader>to

" --------------------------------------------------------------------------------
"  AutoCmds
" --------------------------------------------------------------------------------
autocmd BufRead :filetype detect

" Place Swap files here
set directory=~/tmp,/var/tmp,/tmp

" Fire up Pathogen, load plugins
call pathogen#infect()

