" Basics {
  set nocompatible
  set encoding=utf-8

  " Size {
    set lines=24
    set columns=80
  " }

  " Keymappings {
    let mapleader=" "
    noremap ; :
    nnoremap Q <nop>

    " TODO: Search visual mode selection

    " Line bubbling & Indentation {
      vmap K [egv
      vmap J ]egv

      vnoremap H <gv
      vnoremap L >gv
    " }
  " }
" }

" NeoBundle {
  " Init {
    set rtp+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
  " }

  " Bundled plugins {
    " Let NeoBundle handle itself {
      NeoBundle 'Shougo/vimproc'
      NeoBundle 'Shougo/neobundle.vim'
    " }

    NeoBundle 'tpope/vim-unimpaired'
    NeoBundle 'tpope/vim-markdown'
    NeoBundle 'tpope/vim-commentary'
    NeoBundle 'bling/vim-airline'
    NeoBundle 'godlygeek/tabular'
    NeoBundle 'VisIncr'
    NeoBundle 'sindriava/goyo.vim'
    NeoBundle 'dag/vim-fish'
    
    " Colorschemes & syntax {
      NeoBundle 'chriskempson/base16-vim'
      NeoBundle 'beyondmarc/glsl.vim'
    " }

    " Completion and snippets {
      NeoBundle 'Shougo/neocomplete.vim'
      NeoBundle 'Shougo/neosnippet'
      NeoBundle 'Shougo/neosnippet-snippets'
    " }

    " Haskell {
      NeoBundle 'dag/vim2hs'
      NeoBundle 'eagletmt/ghcmod-vim'
      NeoBundle 'eagletmt/neco-ghc'
    " }

    " Unused {
    "   NeoBundle 'L9'
    "   NeoBundle 'tpope/vim-endwise'
    "   NeoBundle 'kien/ctrlp.vim'
    "   NeoBundle 'tpope/vim-surround'
    " }
    
    NeoBundleCheck " Check for uninstalled plugins
  " }

  call neobundle#end()
" }

" Plugin specific settings {
  " Haskellmode {
    let g:haddock_browser = "open"
    let g:hpaste_author = 'Sindriava'

    let g:haskell_multiline_strings = 0

    nnoremap <leader>t :GhcModType<CR>
    nnoremap <leader>T :GhcModTypeClear<CR>

    au BufEnter *.hs compiler hlint

    " Add cabal executables to PATH
    let $PATH .= ':' . "~/.cabal/bin"
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

  " Markdown {
    autocmd FileType markdown nnoremap <buffer> <leader>p :silent ! open -a "Marked 2" % &<CR>
  " }

  " Commentary {
    noremap <leader>c :Commentary<CR>
  " }

  " Airline {
    set laststatus=2
    set noshowmode

    let g:airline_powerline_fonts = 1

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
  " }

  " Goyo {
    nnoremap <silent> § :Goyo<CR>
  " }
" }


" General {
  set backspace=indent,eol,start
  set fileformats=unix,dos
  set iskeyword+=$,%,@,#

  set autoread
  set hidden

  " Backups {
    set nobackup
    set noswapfile
  " }
  
  " Disable beeping {
    set noerrorbells
    set vb t_vb=  
  " }

  " Persistent undo {
    if has("persistent_undo")
      silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
      set undodir=~/.vim/undo
      set undofile
    endif
  " }
" }

" Filetypes & Formatting {
  syntax on
  set nowrap

  " Indentation {
    filetype plugin indent on
    set smartindent
    set ts=2 sts=2 sw=2 expandtab
  " }

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
" }

" Search {
  set incsearch
  set smartcase
  set nohlsearch
" }

" UI {
  set number
  set scrolloff=5
  set showcmd
  set showmatch
  
  set guifont=Input:h16
  colorscheme base16-eighties
  set background=dark

  " GUI {
    if has("gui_running")
      set guioptions=c
    endif
  " }
" }

" Commands {
  command! Vimrc e ~/.vimrc
" }
