" Basics {
  set nocompatible
  set encoding=utf-8
  set guifont=Meslo\ LG\ M\ for\ Powerline:h16
" }

" Vundle {
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()
" }

" Bundled plugins {
  Bundle 'L9'
  Bundle 'gmarik/vundle'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-unimpaired'
  Bundle 'tpope/vim-markdown'
  Bundle 'kien/ctrlp.vim'
  Bundle 'bling/vim-airline'
  Bundle 'msanders/snipmate.vim'
  Bundle 'tComment'
  Bundle 'Align'
  Bundle 'VisIncr'
  Bundle 'chriskempson/base16-vim'

  " To review {
    Bundle 'tpope/vim-speeddating'
    Bundle 'tpope/vim-fugitive'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'mattn/webapi-vim'
    Bundle 'mattn/gist-vim'
    Bundle 'surround.vim'
    Bundle 'sophacles/vim-processing'
  " }
" }

" General {
  set backspace=indent,eol,start

  set nobackup
  set noswapfile
  " set backup
  " set backupdir=~/.vim/backup
  " set directory=~/.vim/tmp

  set fileformats=mac,unix,dos
  set iskeyword+=_,$,%,@,#
  set noerrorbells
  set autoread
  set hidden
" }

" Filetypes & Formatting {
  syntax on
  set nowrap

  filetype plugin indent on
  set smartindent
  set ts=2 sts=2 sw=2 expandtab

  " Vimrc reloading {
    augroup reload_vimrc
      autocmd!
      autocmd BufWritePost $MYVIMRC source $MYVIMRC
      autocmd BufWritePost $MYVIMRC AirlineRefresh
    augroup END
  " }
" }

" Search {
  set incsearch
  set ignorecase
  set smartcase
  set nohlsearch
" }

" UI {
  set number
  set ruler
  set scrolloff=5
  set showcmd
  set showmatch
  
  colorscheme base16-eighties

  " GUI {
    if has("gui_running")
      set guioptions=c
    endif
  " }
" }

" Plugin specific settings {
  " Airline {
    set laststatus=2
    set noshowmode

    let g:airline#extensions#tabline#enabled=1
    let g:airline_powerline_fonts=1

    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
  " }
" }

" Keymappings {
  let mapleader=" "

  nnoremap Q <nop>
  nnoremap <leader>; q:
  vnoremap <leader>; q:

  noremap ; :

  vnoremap <leader>= :Align =<CR>

  noremap <leader>c :TComment<CR>

  nnoremap <leader>p :CtrlP<CR>
  nnoremap <leader>b :CtrlPBuffer<CR>
  
  nnoremap <silent> <Leader>/ :set invhlsearch<CR>

  " Line bubbling & Indentation {
    vmap K [egv
    vmap J ]egv

    vnoremap H <gv
    vnoremap L >gv
  " }
" }

" Commands {
  command! -range Reverse <line1>,<line2>!tail -r
  command! Vimrc e ~/.vimrc
" }
