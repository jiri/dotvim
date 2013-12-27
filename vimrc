" Basics {
  set nocompatible
  set encoding=utf-8
  set guifont=Mensch\ for\ Powerline:h16
" }

" Vundle {
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()
" }

" Bundled plugins {
  Bundle 'L9'
  Bundle 'gmarik/vundle'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-speeddating'
  Bundle 'tpope/vim-unimpaired'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-markdown'
  Bundle 'Lokaltog/vim-powerline'
  Bundle 'Lokaltog/vim-easymotion'
  Bundle 'mattn/webapi-vim'
  Bundle 'mattn/gist-vim'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'stephenmckinney/vim-solarized-powerline'
  Bundle 'surround.vim'
  Bundle 'msanders/snipmate.vim'
  Bundle 'tComment'
  Bundle 'Align'
  Bundle 'dart-lang/dart-vim-plugin'
  Bundle 'VisIncr'
  " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
  Bundle 'matchit.zip'
  Bundle 'kien/ctrlp.vim'
  Bundle 'chriskempson/base16-vim'
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
  set hidden
" }

" Formatting {
  filetype plugin indent on
  syntax on
  set smartindent
  set nowrap

  " Indentation {
    set ts=2 sts=2 sw=2 expandtab

    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css  setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  " }
" }

" Search {
  set incsearch
  set smartcase
  set hlsearch
" }

" UI {
  set number
  set ruler
  set scrolloff=5
  set showcmd
  set showmatch
  
  " set background=dark
  " let g:solarized_contrast="high"
  " colorscheme solarized
  colorscheme base16-eighties

  " GUI {
    if has("gui_running")
      set guioptions=ce
    endif
  " }
" }

" Plugin specific settings {
  " Powerline {
    set laststatus=2
    let Powerline_symbols="fancy"
    " let Powerline_colorscheme="solarized16"
  " }
  
  " Sparkup {
    " let g:sparkupExecuteMapping="<leader>e"
  " }
" }

" Keymappings {
  let mapleader=" "

  nnoremap Q <nop>

  nnoremap ; :
  vnoremap ; :

  nnoremap <leader>; q:
  vnoremap <leader>; q:

  nnoremap <leader>c :TComment<CR>
  vnoremap <leader>c :TComment<CR>
  nnoremap <leader>w :w<CR>

  nnoremap <leader>p :CtrlP<CR>
  nnoremap <leader>b :CtrlPBuffer<CR>
  
  nnoremap <silent> <Leader>/ :nohlsearch<CR>

  " Line Bubbling  {
    vmap K [egv
    vmap J ]egv
  " }

  " Indentation {
    vnoremap H <gv
    vnoremap L >gv
  " }
" }

" Commands {
  command! -range Reverse <line1>,<line2>!tail -r
  command! Vimrc e ~/.vimrc

  " Vimrc reloading {
    augroup reload_vimrc
      autocmd!
      autocmd BufWritePost $MYVIMRC source $MYVIMRC
    augroup END
  " }
" }
