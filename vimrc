" Basics {
  set nocompatible
  set encoding=utf-8
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 13
  let mapleader="'"
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
  Bundle 'tpope/vim-unimpaired'
  Bundle 'tpope/vim-fugitive'
  Bundle 'scrooloose/nerdtree'
  Bundle 'Lokaltog/vim-powerline'
  Bundle 'stephenmckinney/vim-solarized-powerline'
  Bundle 'mattn/webapi-vim'
  Bundle 'mattn/gist-vim'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'godlygeek/tabular'
  Bundle 'sjl/gundo.vim'
  Bundle 'repeat.vim'
  Bundle 'surround.vim'
  Bundle 'tComment'
  Bundle 'git://git.wincent.com/command-t.git'
  Bundle 'Align'
  Bundle 'xoria256.vim'

  " Bundles to check out later {
    " Bundle 'Lokaltog/vim-easymotion'
    " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
  " }
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
  set nohlsearch
" }

" UI {
  set number
  set ruler
  set scrolloff=5
  set showcmd
  set showmatch
  
  set background=dark
  let g:solarized_contrast="high"
  colorscheme solarized

  " GUI {
    if has("gui_running")
      set guioptions=ce
    endif
  " }
" }

" Plugin specific settings {
  " NERDTree {
    let NERDTreeDirArrows=1
    let NERDTreeWinPos="right"
    map <leader>f :NERDTreeToggle<CR>
  " }

  " Powerline {
    set laststatus=2
    let Powerline_symbols="fancy"
    let Powerline_colorscheme="solarized16"
  " }

  " Gundo {
    let g:gundo_width=25
    let g:gundo_bottom=1
    let g:gundo_preview_height=12
    let g:gundo_right=0
    let g:gundo_help=0
    let g:gundo_close_on_revert=1

    nmap <leader>u :GundoToggle<CR>
  " }

  " Command-T {
    let g:CommandTMinHeight=4
    let g:CommandTMaxHeight=12
    let g:CommandTMatchWindowAtTop=1

    let g:CommandTAcceptSelectionMap="<CR>"
    let g:CommandTAcceptSelectionSplitMap="<C-h>"
    let g:CommandTAcceptSelectionVSplitMap="<C-v>"

    set wildignore+=*.o,*.obj,*~,.git,.svn,.hg
  " }
" }

" Keymappings {
  nnoremap ; :
  vnoremap ; :
 
  map <leader>c :TComment<CR>
  nnoremap 'w <C-W>
  
  vnoremap < <gv
  vnoremap > >gv

  " Line Bubbling {
    vmap K [egv
    vmap J ]egv
  " }

  cmap w!! w !sudo tee % >/dev/null
  
  " VimCasts mappings, to be assesed. {
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%
  " }
" }
