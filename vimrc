set number
colorscheme desert
syntax enable

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
