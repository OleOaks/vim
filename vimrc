set number
colorscheme elflord
syntax enable
set belloff=all

"Create Markdown Hyperlink from URL
let @h = 'ByEi[Ea]()hp'

nnoremap ,h = ByEi[Ea]()hp

" BASIC SETUP:

" Map escape
:imap jk <Esc>
:imap kj <Esc>


" enter the curent millenium
set nocompatible

filetype plugin on

" FINDING FILES:

" Search down into subfolders
" Proveds tab-completion for all file-related tasks
set  path+=**

" Display all matching files when we tab complete

set wildmenu

" NOW WE CAN:
" - Hit tab to :find  by  partial match
" - Use * to make it fuzzy

" let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

set title

" INDENTING
set expandtab
set shiftwidth=2
set softtabstop=2

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " ...
endif

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType JavaScript setlocal shiftwidth=2 tabstop=2 

if !empty(glob("~/.vim/autoload/plug.vim"))
  " Specify a directory for plugins
  " - For Neovim: ~/.local/share/nvim/plugged
  " - Avoid using standard Vim directory names like 'plugin'
  call plug#begin('~/.vim/plugged')

  " Make sure you use single quotes

  " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
  Plug 'pangloss/vim-javascript'

  " Initialize plugin system
  call plug#end()
endif
