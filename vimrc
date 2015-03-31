" Basics {
  set nocompatible
  set encoding=utf-8
  set guifont=Input:h16

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
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/nerdtree'
    Plugin 'kien/ctrlp.vim'
    Plugin 'bling/vim-airline'
    Plugin 'Align'
    Plugin 'VisIncr'
    Plugin 'chriskempson/base16-vim'
    Plugin 'tpope/vim-surround'

    " Console {
      Plugin 'Shougo/vimproc'
      Plugin 'Shougo/vimshell.vim'
    " }

    " Rust {
      Plugin 'rust-lang/rust.vim'
      Plugin 'cespare/vim-toml'
    " }

    " Zen mode {
      Plugin 'sindriava/goyo.vim'
      Plugin 'junegunn/limelight.vim'
    " }

    " Completion and snippets {
      Plugin 'Shougo/neocomplete.vim'
      Plugin 'Shougo/neosnippet'
      Plugin 'Shougo/neosnippet-snippets'
    " }

    " Lisp { 
      Plugin 'guns/vim-sexp'
      Plugin 'tpope/vim-sexp-mappings-for-regular-people'
      Plugin 'amdt/vim-niji'
      Plugin 'wlangstroth/vim-racket'
    " }
  " }

  call vundle#end()
" }

" Plugin specific settings {
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

  " TODO: Elaborate
  " VimShell {
    noremap <silent> ` :VimShell<CR>

    let g:vimshell_prompt_expr = '"λ ".escape(fnamemodify(getcwd(), ":~:h"), "\\[]()?! ")." "'
		let g:vimshell_prompt_pattern = '^λ \%(\f\|\\.\)\+ '

    let g:vimshell_disable_escape_highlight = 1
    let g:vimshell_cat_command = "less"
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
