call plug#begin('~/.vim/plugged')

"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf'

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'tools-life/taskwiki'
"Plug 'itchyny/calendar.vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'lervag/vimtex' 
Plug 'vim-python/python-syntax'
Plug 'bfrg/vim-cpp-modern'
Plug 'pangloss/vim-javascript'
Plug 'habamax/vim-godot'

Plug 'joshdick/onedark.vim' 
Plug 'KeitaNakamura/neodark.vim'

"not used anymore
"Plug 'flazz/vim-colorschemes'
"Plug 'PProvost/vim-ps1'
"Plug 'sei40kr/SpaceVim-onedark'
"Plug 'jiangmiao/auto-pairs'
"Plug 'alvan/vim-closetag'
"Plug 'tikhomirov/vim-glsl'
"Plug 'takac/vim-hardtime'

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
set colorcolumn=79
colorscheme onedark
" highlight Comment ctermfg=green

" TODO:
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"if (has("termguicolors"))
"  set termguicolors
"endif

" Commands
" command Makepy ':read ~/.vim/template/skeleton.py' 


" Shortcuts
let mapleader = " "
let maplocalleader = " "
map <leader>[ :call ToggleColumn()<CR>
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
" autocmd VimEnter * HardTimeOn
" let g:hardtime_allow_different_key = 1
" let g:hardtime_maxcount = 2

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" == Developement settings ==
" VimTeX requirement
set encoding=utf8
syntax enable
filetype plugin indent on

" VimWiki requirements
set nocompatible
filetype plugin on
syntax on

" Python
let g:python_highlight_all = 1

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

function! ToggleColumn() 
  if &colorcolumn
    set colorcolumn=0
  else
    set colorcolumn=79
  endif
endfunction

"function! Beautify()
"  if &syntax == "json"
"    %! json_reformat<CR>
"  endif
"endfunction
