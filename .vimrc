call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'takac/vim-hardtime'
"Plug 'jiangmiao/auto-pairs'
"Plug 'alvan/vim-closetag'
Plug 'lervag/vimtex' 
Plug 'PProvost/vim-ps1'
Plug 'habamax/vim-godot'
Plug 'vim-python/python-syntax'

Plug 'joshdick/onedark.vim' 
Plug 'flazz/vim-colorschemes'
Plug 'KeitaNakamura/neodark.vim'

call plug#end()

" == Editor settings ==
" Preferences
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
colorscheme neodark
" highlight Comment ctermfg=green

" Commands
" command Makepy ':read ~/.vim/template/skeleton.py' 

" Shortcuts
let mapleader = " "
let maplocalleader = " "
map <leader>h :noh<CR>
map <leader>u gUiwe
map <leader>U guiwe
nnoremap Y y$

" Navigation
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Vim HardTime plugin
autocmd VimEnter * HardTimeOn
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2

" Python
let g:python_highlight_all = 1


" == Developement settings ==
" VimTeX requirement
set encoding=utf8
syntax enable
filetype plugin indent on

" VimWiki requirements
set nocompatible
filetype plugin on
syntax on

" Godot requirements and settingns
" TODO: check plugin site for second solution with storing settings
let g:godot_executable = 'godot.exe'
func! GodotSettings() abort
  "setlocal foldmethod=expr
  setlocal tabstop=4
  map <leader>r :GodotRun<CR>
endfunc
augroup godot | au!
  au FileType gdscript call GodotSettings()
augroup end
