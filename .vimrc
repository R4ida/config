call plug#begin('~/.vim/plugged')

"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'lervag/vimtex' 
Plug 'vim-python/python-syntax'
Plug 'bfrg/vim-cpp-modern'
Plug 'pangloss/vim-javascript'

Plug 'dikiaap/minimalist'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim' 

"not used anymore
"Plug 'junegunn/fzf'
"Plug 'tools-life/taskwiki'
"Plug 'itchyny/calendar.vim'
"Plug 'KeitaNakamura/neodark.vim'
"Plug 'flazz/vim-colorschemes'
"Plug 'PProvost/vim-ps1'
"Plug 'sei40kr/SpaceVim-onedark'
"Plug 'jiangmiao/auto-pairs'
"Plug 'alvan/vim-closetag'
"Plug 'tikhomirov/vim-glsl'
"Plug 'habamax/vim-godot'
"Plug 'takac/vim-hardtime'

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
set colorcolumn=79

let lightmode = system("[ $(cat ~/.brightmode) == 'light' ] && echo -n 1 || echo -n 0 ")
if lightmode 
  colorscheme gruvbox
else
  colorscheme minimalist
  "colorscheme minimalist
endif

" shortcuts
let mapleader = " "
let maplocalleader = " "
map <leader>[ :call ToggleColumn()<CR>
map <leader>h :noh<CR>
map <leader>u gUiwe
map <leader>U guiwe
nnoremap Y y$

" navigation
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" == plugin settings ==
" vimwiki
let g:vimwiki_list = [{'path': '~/documents/vimwiki/'}]
" , 'syntax': 'markdown', 'ext': '.md'

" limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" vimtex requirement
set encoding=utf8
syntax enable
filetype plugin indent on

" vimwiki requirements
set nocompatible
filetype plugin on
syntax on

" python
let g:python_highlight_all = 1

" == custom functions ==
function! ToggleColumn() 
  if &colorcolumn
    set colorcolumn=0
  else
    set colorcolumn=79
  endif
endfunction
