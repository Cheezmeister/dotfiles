
" Auto-install vim-plug
if has('win32')
  let s:runtime="~/vimfiles"
else
  let s:runtime="~/.vim"
endif
let s:autoload=expand(s:runtime."/autoload")
if !filereadable(s:autoload."/plug.vim")
    echo "Installing vim-plug and plugins. Restart vim after finishing the process."
    if !isdirectory(s:autoload)
        silent call mkdir(s:autoload, 'p')
    endif
    execute "!curl -fLo ".s:autoload."/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

call plug#begin('~/.vim/plugged')

Plug 'PeterRincker/vim-argumentative'
Plug 'Shougo/unite.vim'
Plug 'SirVer/ultisnips'
Plug 'benmills/vimux'
Plug 'bling/vim-airline.git'
Plug 'freitass/todo.txt-vim'
Plug 'honza/vim-snippets'
Plug 'kien/rainbow_parentheses.vim/'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'

Plug 'tpope/vim-dispatch'
Plug 'kchmck/vim-coffee-script'
Plug 'mctenshi/vim-literate-coffeescript'
Plug 'wavded/vim-stylus'
Plug 'digitaltoad/vim-jade'

call plug#end()
