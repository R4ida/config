call plug#begin('~/.vim/plugged')

"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
" Plug 'christoomey/vim-tmux-navigator'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'patrickdavey/vimwiki_markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'tools-life/taskwiki'
" Plug 'farseer90718/vim-taskwarrior'   addons for taskwiki
" Plug 'powerman/vim-plugin-AnsiEsc'
" Plug 'majutsushi/tagbar'

" Plug 'lervag/vimtex' 

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

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

" Plug 'vim-python/python-syntax'
" Plug 'bfrg/vim-cpp-modern'
" Plug 'pangloss/vim-javascript'
" Plug 'uiiaoo/java-syntax.vim'
" Plug 'charlespascoe/vim-go-syntax'
" Plug 'jelera/vim-javascript-syntax'

" Plug 'dikiaap/minimalist'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
" Plug 'joshdick/onedark.vim' 

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
map <leader>r :reg<CR>
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
" vimwiki
let g:vimwiki_list =
\ [{'path': '~/documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md',
\ 'template_path': '~/documents/vimwiki/templates/', 'template_default': 'default',
\ 'path_html': '~/documents/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
\ 'html_filename_parameterization': 1,
\ 'template_ext': '.tpl',
\ 'nested_syntaxes': {'c++': 'cpp', 'python': 'python', 'bash': 'bash',
                   \ 'crontab': 'crontab', 'java': 'java', 'sql': 'sql'} }]
" 
" limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" vimtex requirement
set encoding=utf8
filetype plugin indent on

" vimwiki requirements
filetype plugin on
let g:vimwiki_global_ext = 0

lua require('config')

