" Basics {
  set nocompatible
  set encoding=utf-8
  set guifont=Meslo\ LG\ M\ for\ Powerline:h16
" }

" Vundle {
  " Init {
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
  " }

  " Bundled plugins {
    " Let Vundle handle itself
    Plugin 'gmarik/Vundle.vim'

    Plugin 'L9'
    Plugin 'tpope/vim-endwise'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'tpope/vim-markdown'
    Plugin 'kien/ctrlp.vim'
    Plugin 'bling/vim-airline'
    Plugin 'msanders/snipmate.vim'
    Plugin 'tComment'
    Plugin 'Align'
    Plugin 'VisIncr'
    Plugin 'chriskempson/base16-vim'
    Plugin 'wting/rust.vim'

    " To review {
      Plugin 'tpope/vim-speeddating'
      Plugin 'tpope/vim-fugitive'
      Plugin 'Lokaltog/vim-easymotion'
      Plugin 'surround.vim'
    " }
  " }

  call vundle#end()
" }

" General {
  set backspace=indent,eol,start

  set nobackup
  set noswapfile
  " set backup
  " set backupdir=~/.vim/backup
  " set directory=~/.vim/tmp

  " Persistent undo {
    if has("persistent_undo")
      silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
      set undodir=~/.vim/undo
      set undofile
    endif
  " }

  set fileformats=unix,dos
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

  " Help key for vim files {
    autocmd FileType vim setlocal keywordprg=:help
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
