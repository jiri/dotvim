" Basics {
  set nocompatible
  set encoding=utf-8
  set guifont=Input:h16

  " Size {
    set lines=24
    set columns=80
  " }

  " Keymappings {
    noremap ; :
    let mapleader=" "

    nnoremap Q <nop>
    nnoremap <leader>; q:
    vnoremap <leader>; q:

    " Line bubbling & Indentation {
      vmap K [egv
      vmap J ]egv

      vnoremap H <gv
      vnoremap L >gv
    " }
  " }
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
    Plugin 'tpope/vim-commentary'
    Plugin 'kien/ctrlp.vim'
    Plugin 'bling/vim-airline'
    Plugin 'godlygeek/tabular'
    Plugin 'VisIncr'
    Plugin 'chriskempson/base16-vim'
    Plugin 'tpope/vim-surround'

    " Completion and snippets {
      Plugin 'Shougo/neocomplete.vim'
      Plugin 'Shougo/neosnippet'
      Plugin 'Shougo/neosnippet-snippets'
    " }

    " Haskell {
      Plugin 'dag/vim2hs'
      " Plugin 'lukerandall/haskellmode-vim'
      Plugin 'eagletmt/ghcmod-vim'
      Plugin 'eagletmt/neco-ghc'
    " }

    " Console {
      Plugin 'Shougo/vimproc'
    " }

    " Rust {
      Plugin 'rust-lang/rust.vim'
      Plugin 'cespare/vim-toml'
    " }

    " Zen mode {
      Plugin 'sindriava/goyo.vim'
      Plugin 'junegunn/limelight.vim'
    " }
    
    " Other {
      Plugin 'majutsushi/tagbar'
    " }
  " }

  call vundle#end()
" }

" Plugin specific settings {
  " Haskellmode {
    let g:haskell_quasi = 0
    let g:hpaste_author = 'Sindriava'

    let $PATH = $PATH . ':' . expand("~/.cabal/bin") 
    let g:haddock_browser = "open"

    nnoremap <leader>t :GhcModType<CR>
    nnoremap <leader>it :GhcModTypeInsert<CR>
    nnoremap <leader>T :GhcModTypeClear<CR>

    au BufEnter *.hs compiler hlint
  " }

  " TODO: Elaborate
  " NeoComplete {
    let g:acp_enableAtStartup = 0

    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1

    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  " }

  " TODO: Elaborate
  " NeoSnippet {
    " imap <CR> <Plug>(neosnippet_expand_or_jump)
    " smap <CR> <Plug>(neosnippet_expand_or_jump)
    xmap <CR> <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><Tab> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

    " For snippet_complete marker.
    " if has('conceal')
    "   set conceallevel=2 concealcursor=i
    " endif
  " }

  " Niji {
    let g:niji_matching_filetypes = ['lisp', 'racket', 'clojure']
  " }

  " NERDTree {
    nmap <leader><CR> :NERDTreeToggle<CR>
  " }

  " CtrlP {
    nnoremap <leader>p :CtrlP<CR>
    nnoremap <leader>b :CtrlPBuffer<CR>
  " }

  " Commentary {
    noremap <leader>c :Commentary<CR>
  " }

  " Airline {
    set laststatus=2
    set noshowmode

    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1

    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
  " }

  " Goyo {
    nnoremap <silent> § :Goyo<CR>

    let g:goyo_margin_top = 0
    let g:goyo_margin_bottom = 0
  " }
  
  " Tagbar {
    nnoremap <leader>= :TagbarToggle<CR>

    let g:tagbar_autofocus = 1
    let g:tagbar_autoclose = 1
    let g:tagbar_type_haskell = {
      \ 'ctagsbin'  : 'hasktags',
      \ 'ctagsargs' : '-x -c -o-',
      \ 'kinds'     : [
          \  'm:modules:0:1',
          \  'd:data: 0:1',
          \  'd_gadt: data gadt:0:1',
          \  't:type names:0:1',
          \  'nt:new types:0:1',
          \  'c:classes:0:1',
          \  'cons:constructors:1:1',
          \  'c_gadt:constructor gadt:1:1',
          \  'c_a:constructor accessors:1:1',
          \  'ft:function types:1:1',
          \  'fi:function implementations:0:1',
          \  'o:others:0:1'
      \ ],
      \ 'sro'        : '.',
      \ 'kind2scope' : {
          \ 'm' : 'module',
          \ 'c' : 'class',
          \ 'd' : 'data',
          \ 't' : 'type'
      \ },
      \ 'scope2kind' : {
          \ 'module' : 'm',
          \ 'class'  : 'c',
          \ 'data'   : 'd',
          \ 'type'   : 't'
      \ }
    \ }
  " }
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
  set iskeyword+=$,%,@,#
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

  autocmd FileType rust compiler rustc

  " Vimrc {
    augroup reload_vimrc
      autocmd!
      autocmd BufWritePost $MYVIMRC source $MYVIMRC
      autocmd BufWritePost $MYVIMRC AirlineRefresh
    augroup END

    " Help key {
      autocmd FileType vim setlocal keywordprg=:help
    " }
  " }

  " Haskell {
    autocmd FileType haskell command! Hoogle !~/Library/Haskell/bin/hoogle
  " }
" }

" Search {
  set incsearch
  set ignorecase " NOTE: Unnecessary?
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
  set background=dark

  " GUI {
    if has("gui_running")
      set guioptions=c
    endif
  " }
" }

" Commands {
  command! -range Reverse <line1>,<line2>!tail -r
  command! Vimrc e ~/.vimrc

  command! MakeExecutable silent !chmod +x %
" }
