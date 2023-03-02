call plug#begin('~/.vim/plugged')

"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'patrickdavey/vimwiki_markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'tools-life/taskwiki'
" Plug 'farseer90718/vim-taskwarrior'   addons for taskwiki
" Plug 'powerman/vim-plugin-AnsiEsc'
" Plug 'majutsushi/tagbar'

" Plug 'lervag/vimtex' 
" Plug 'vim-python/python-syntax'
" Plug 'bfrg/vim-cpp-modern'
" Plug 'pangloss/vim-javascript'
" Plug 'uiiaoo/java-syntax.vim'
" Plug 'charlespascoe/vim-go-syntax'
" Plug 'jelera/vim-javascript-syntax'

Plug 'williamboman/mason.nvim'


Plug 'dikiaap/minimalist'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim' 

"not used anymore
"Plug 'junegunn/fzf'
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
set laststatus=0
set guicursor=n-v-c-i:block

" let lightmode = system("[ $(cat ~/.brightmode) == 'light' ] && echo -n 1 || echo -n 0 ")
" if lightmode 
"   colorscheme gruvbox
" else
"   colorscheme minimalist
" endif

" colorscheme minimalist

" shortcuts
let mapleader = " "
let maplocalleader = " "
map <leader>[ :call ToggleColumn()<CR>
map <leader>h :noh<CR>
map <leader>r :reg<CR>
map <leader>u gUiwe
map <leader>U guiwe
nnoremap Y y$

" navigation
set mouse=a
map <ScrollWheelUp> 5<C-Y>
map <ScrollWheelDown> 5<C-E>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" == plugin settings ==
" vimwiki
let g:vimwiki_list =
\ [{'path': '~/documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md',
\ 'template_path': '~/documents/vimwiki/templates/', 'template_default': 'default',
\ 'path_html': '~/documents/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
\ 'html_filename_parameterization': 1,
\ 'template_ext': '.tpl',
\ 'nested_syntaxes': {'c++': 'cpp', 'python': 'python', 'bash': 'bash',
                   \ 'crontab': 'crontab'} }]
" 
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
