"------------------------------------------------------------
" BML Hackery - Here Be Dragons

" All the cool kids use comma. Not this punk.
let mapleader = "\\"

nnoremap <leader>e :edit ~/.vimrc<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>t :edit .todo<cr>
nnoremap <leader>? :!xdg-open 'http://hea-www.harvard.edu/~fine/Tech/vi.html'<cr>


" Place Swap files here
set directory=~/tmp,/var/tmp,/tmp

" Fire up Pathogen, load plugins
call pathogen#infect()

