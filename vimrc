" Basics {
  set nocompatible
  set encoding=utf-8
  set guifont="Droid Sans Mono 10"
  let mapleader=","
" }

" Pathogen {
  call pathogen#infect()
  call pathogen#helptags()
" }

" General {
  set backspace=indent,eol,start
  set backup
  set backupdir=~/.vim/backup
  set directory=~/.vim/tmp
  set fileformats=unix,dos,mac
  set iskeyword+=_,$,%,@,#
  set noerrorbells
  set autoread
" }

" Formatting {
  syntax on
  filetype plugin indent on
  set smartindent
  set shiftwidth=2
  set softtabstop=2
  set tabstop=8
  set nowrap
" }

" Search {
  set incsearch
  set smartcase
  set nohlsearch
" }

" UI {
  set number
  set ruler
  set scrolloff=5
  set showcmd
  set showmatch

  " GUI {
  if has("gui_running")
    set guioptions=ce
  endif
  " }
  
  "set background=dark
  "colorscheme solarized
  
  colorscheme wombat
" }

" NERDTree {
  let NERDTreeDirArrows=1
  let NERDTreeWinPos="right"
  map <F2> :NERDTreeToggle<CR> 
" }

" Powerline {
  set laststatus=2
  let Powerline_symbols="compatible"
" }

" Command-T {
  noremap <leader>o <Esc>:CommandT<CR>
  let g:CommandTScanDotDirectories = 1  
  let g:CommandTMatchWindowAtTop = 1
  let g:CommandTAcceptSelectionMap = '<C-t>'
  let g:CommandTAcceptSelectionTabMap = '<CR>'
" }

" Miscellaneous mappings {
  nnoremap ; :
  cmap w!! w !sudo tee % >/dev/null
" }
