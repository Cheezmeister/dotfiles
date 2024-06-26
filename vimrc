
" BML Hackery - Here Be Dragons
"------------------------------------------------------------

" --------------------------------------------------------------------------------
"  Dangerous things
"  (These override default behaviour)
" --------------------------------------------------------------------------------

" Because yy the hell not?
nnoremap Y y$

" Because J key said so (and 0 concurs)
nnoremap <Enter> :

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
nnoremap @' @"
inoremap <C-R>; <C-R>:
cnoremap <C-R>; <C-R>:
nnoremap @; @:

" Because I'm a horrible person
cabbrev w!! w !sudo tee > /dev/null %

cabbrev vsb vs \| b
cabbrev cmlt CMakeLists.txt

" Because sometimes it's all about the code
nnoremap <Backspace> :helpclose \| cclose \| call VimuxCloseRunner() \| NERDTreeClose \| TagbarClose<CR>

" --------------------------------------------------------------------------------
" Abbreviations
" --------------------------------------------------------------------------------
iabbrev yolo ¯\_(ツ)_/¯
iabbrev look_of_disapproval ಠ_ಠ
" iabbrev bml Brendan Luchen
iabbrev alphabet ABCDEFGHIJKLMNOPQRSTUVWXYZ


" --------------------------------------------------------------------------------
" Options
" --------------------------------------------------------------------------------
set cursorline cursorcolumn
set noswapfile " Do u even Git!?
set omnifunc=syntaxcomplete#Complete
set incsearch
set hlsearch
set hidden
set autoindent cindent smartindent
set smarttab expandtab
set shiftwidth=2 tabstop=2
set encoding=utf-8 " I'm a civilized human
set ttimeout ttimeoutlen=20 " I'm not on dialup
set timeout timeoutlen=400 " Nor the world's fastest typist
set scrolloff=4
set autoread
set background=dark " Always
filetype plugin on
filetype plugin indent on
syntax on " Duh.

filetype plugin on
syntax on

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
nnoremap <leader>z :w<CR><C>z
nnoremap <leader>a :mksession!<CR>:xa<CR>
vnoremap <leader>c "*y

" Meta
nnoremap <leader>me :edit $MYVIMRC<cr>
nnoremap <leader>mr :source $MYVIMRC<cr>
nnoremap <leader>mp :source $MYVIMRC<cr>:PlugInstall<cr>
vnoremap <leader>mx "xy@x<cr>

" Pluginery
nnoremap <leader>v :call VimuxRunCommand("")<Left><Left>
nnoremap <leader>d :Dispatch<space>
nnoremap <leader>b :wa<cr>:call VimuxRunLastCommand()<cr>
nnoremap <leader>f :FZF<cr>
nnoremap <leader>g :Ag <C-R><C-W>

" Todo lists
nnoremap <leader>lt :split ~/.todo<cr>
nnoremap <leader>ll :split .todo<cr>

" Inspections
nnoremap <leader>if :ALEFix<cr>

" Toggling things
nnoremap <leader>ta :AirlineToggle<cr>
nnoremap <leader>tn :NvimTreeToggle<cr>
nnoremap <leader>to :TagbarToggle<cr>
nnoremap <leader>tr :RainbowParenthesesToggle<cr>
nnoremap <leader>tl :set number! relativenumber! list!<cr>
nnoremap <leader>tp :set paste!<cr>
nnoremap <leader>tw :set wrap!<cr>
nnoremap <leader>ti :ALEToggle<cr>

" Miscellany
nnoremap <Leader>] :tag<space>
nnoremap <leader>h i" <esc>80a-<esc>yypO

" --------------------------------------------------------------------------------
"  Mini-Plugins
" --------------------------------------------------------------------------------
function! s:lit(language)
  runtime! syntax/markdown.vim
  unlet b:current_syntax
  syn clear markdownCode
  exec "syn include @inlinecode syntax/" . a:language . ".vim"
  syn region inlineCodeBlock start='^    ' end='$' contains=@inlinecode
endfunction
function! s:autolit()
  let l:language=split(@%, '\.')[-2] "FIXME not always the extension
  call s:lit(language)
endfunction
command! -nargs=1 Lit call s:lit(<args>)
command! Autolit call s:autolit()
hi CursorColumn ctermbg=black | hi CursorLine ctermbg=black

colorscheme habamax
