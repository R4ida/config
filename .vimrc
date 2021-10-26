call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'joshdick/onedark.vim' 
Plug 'flazz/vim-colorschemes'
Plug 'takac/vim-hardtime'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'lervag/vimtex' 

call plug#end()

"" VimTeX requirement
set encoding=utf8

"" VimWiki requirements
set nocompatible
filetype plugin on
syntax on

"" Preferences
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set hlsearch
set ruler
set ignorecase
set clipboard=unnamedplus
set relativenumber
set number
colorscheme onedark
""highlight Comment ctermfg=green

"" vim HardTime plugin
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
