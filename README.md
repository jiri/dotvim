# Sindriava's `.vim` folder

Hello, if you stumbled here, you are probably interested in my 
`vim` config. Or you'll hopefully be in a moment. I spent a lot
of time perfecting it, but it's still pretty rough. This file
will take you through some of the details of the file syntax
and plugins.

## The `.vimrc` file

The `.vimrc` file is a standard vim config file, with the added 
bonus of being somehow better formatted.

```vim
" Basics {
  set nocompatible
  set encoding=utf-8
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 13
  let mapleader="'"
" }
```

## Vundle

All the plugins are handled by the `Vundle` plugin, the only one
present in the repo, for ease of installation on new machines.
The should be installed automatically with the `:BundleInstall`
command.

For more info on Vundle, check out [https://github.com/gmarik/vundle][].
