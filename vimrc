set number
colorscheme elflord
syntax enable
set belloff=all

"Create Markdown Hyperlink from URL
let @h = 'ByEi[Ea]()hp'

nnoremap ,h = ByEi[Ea]()hp


" BASIC SETUP:
map <SPACE> <leader>
let maplocalleader = ","
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :w<cr> <bar> :source $MYVIMRC<cr> <bar> :q<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Map Insert mode completion (:h ins-completion)
"inoremap <C-l> <C-x><C-l> 
"inoremap <C-n> <C-x><C-n> 
"inoremap <C-i> <C-x><C-i> 
"inoremap <C-]> <C-x><C-]> 
"inoremap <C-f> <C-x><C-f> 
"inoremap <C-o> <C-x><C-o> 


" Map escape
:inoremap jk <Esc>
:inoremap kj <Esc>
":inoremap <esc> <nop> DON'T USE! During insert mode; Caused arrow keys to enter OA, OB, OC, OD. Also changed
"backspace entering weird characters

" Auto commands
augroup filetype_javascript
  :autocmd!
  :autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
  :autocmd FileType javascript nnoremap <buffer> <localleader>dw :%s/\\$//g<esc>
  :autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
  :autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 
augroup END

augroup filetype_python
  :autocmd!
  :autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
  :autocmd FileType python :iabbrev <buffer> iff if:<left>
  :autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
augroup END

augroup filetype_html
  :autocmd!
  :autocmd FileType html nnoremap <buffer> <localleader>c I<!--<esc>g_a--><esc>
  :autocmd FileType html setlocal shiftwidth=2 tabstop=2
augroup END

augroup filetype_c
  :autocmd!
  :autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
  :autocmd FileType c nnoremap <buffer> <localleader>C ^xx<esc>
  :autocmd FileType c map <F9> :w<cr>:!clear && gcc -Wall % -o %< <cr>
  :autocmd FileType c map <F10> :w<cr>:!clear && gcc -Wall % -o %< && ./%< <cr>
  :autocmd FileType c nnoremap <localleader>p :!./a.out<cr>
augroup END
  
" enter the curent millenium
set nocompatible

filetype plugin on

" FINDING FILES:

" Search down into subfolders
" Proveds tab-completion for all file-related tasks
set  path+=**

" Display all matching files when we tab complete

set wildmenu

" Make gf files that start with / relative to project working directory
" https://stackoverflow.com/questions/42625117/make-vim-to-consider-current-folder-the-root 
nnoremap <silent> gf :let @/ = substitute(expand('<cfile>'), '^/', '', '')
                   \  <bar>normal gngf<cr>

" NOW WE CAN:
" - Hit tab to :find  by  partial match
" - Use * to make it fuzzy

" let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_banner=0

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


if !empty(glob("~/.vim/autoload/plug.vim"))
  " Specify a directory for plugins
  " - For Neovim: ~/.local/share/nvim/plugged
  " - Avoid using standard Vim directory names like 'plugin'
  call plug#begin('~/.vim/plugged')

  " Make sure you use single quotes

  " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
  Plug 'pangloss/vim-javascript'
  Plug 'vim-airline/vim-airline'

  " Initialize plugin system
  call plug#end()
  
  let g:airline_powerline_fonts = 1
endif

function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

nmap <Leader>j :call GotoJump()<CR>
