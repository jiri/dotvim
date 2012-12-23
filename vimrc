" Basics {
  set nocompatible
  set encoding=utf-8
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 13
  let mapleader=","
" }

" Vundle {
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()
" }

" Bundled plugins {
  Bundle 'gmarik/vundle'
  Bundle 'L9'

  Bundle 'AndrewRadev/splitjoin.vim' 
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-speeddating'
  Bundle 'scrooloose/nerdtree'
  Bundle 'Lokaltog/vim-powerline'

  Bundle 'FuzzyFinder'
  Bundle 'repeat.vim'
  Bundle 'surround.vim'
  Bundle 'tComment'
" }

" Bundles to check out later {
  " Bundle 'Lokaltog/vim-easymotion'
  " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Bundle 'Align'
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
  filetype plugin indent on
  syntax on
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
  
  colorscheme wombat

  " GUI {
  if has("gui_running")
    set guioptions=ce
  endif
  " }
" }

" NERDTree {
  let NERDTreeDirArrows=1
  let NERDTreeWinPos="right"
  map <F2> :NERDTreeToggle<CR> 
" }

" Powerline {
  set laststatus=2
  let Powerline_symbols="fancy"
" }

" Command-T {
  noremap <leader>o <Esc>:CommandT<CR>
  noremap ` <Esc>:CommandT<CR>
  let g:CommandTScanDotDirectories = 1  
  let g:CommandTMatchWindowAtTop = 1
  let g:CommandTAcceptSelectionMap = '<C-t>'
  let g:CommandTAcceptSelectionTabMap = '<CR>'
" }

" Miscellaneous mappings {
  nnoremap ; :
  cmap w!! w !sudo tee % >/dev/null
" }
