call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'joshdick/onedark.vim' 
Plug 'flazz/vim-colorschemes'
Plug 'takac/vim-hardtime'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

call plug#end()

set number
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set hlsearch
set ruler
set ignorecase
set clipboard=unnamedplus
set relativenumber
syntax on
colorscheme onedark
highlight Comment ctermfg=green
autocmd VimEnter * HardTimeOn
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
