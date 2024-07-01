call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Plug 'lervag/vimtex' 

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'altercation/vim-colors-solarized'

call plug#end()

" == editor settings ==
" preferences
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
set laststatus=0
set guicursor=n-v-c-i:block

" shortcuts
let mapleader = " "
let maplocalleader = " "
map <leader>h :noh<CR>
map <leader>r :luafile %<CR>
map <leader>a :Neotree<CR>
map <leader>u gUiwe
map <leader>U guiwe

" navigation
set mouse=a
map <ScrollWheelUp> 5<C-Y>
map <ScrollWheelDown> 5<C-E>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" vim-visual-multi
" noremap <C-k> <C-Up>
" noremap <C-j> <C-Down>
" noremap <C-h> <C-Left>
" noremap <C-l> <C-Right>
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]    = '<M-j>'   " new cursor down
let g:VM_maps["Add Cursor Up"]      = '<M-k>'   " new cursor up

" == plugin settings ==
" vimtex requirement
set encoding=utf8
filetype plugin indent on

lua require('config')
