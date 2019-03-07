
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
Plug 'SirVer/ultisnips'
Plug 'benmills/vimux'
Plug 'bling/vim-airline'
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
Plug 'rking/ag.vim'
Plug 'tpope/vim-dispatch'
Plug 'xolox/vim-misc', { 'for': 'cpp' } 
Plug 'xolox/vim-easytags', { 'for': 'cpp' }
Plug 'altercation/vim-colors-solarized'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'

" Language packs turned on as needed
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
" Plug 'freitass/todo.txt-vim'
" Plug 'kchmck/vim-coffee-script'
" Plug 'mctenshi/vim-literate-coffeescript'
" Plug 'wavded/vim-stylus', { 'for': 'stylus' }
" Plug 'digitaltoad/vim-jade'
" Plug 'elixir-lang/vim-elixir'
" Plug 'slime-lang/vim-slime'
" Plug 'wting/rust.vim'

call plug#end()
