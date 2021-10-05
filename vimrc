set nocompatible
set history

set relativenumber
" four-space tabs
filetype plugin indent on
setlocal shiftwidth=2 softtabstop=2 expandtab
au FileType python setl shiftwidth=4 tabstop=4

" ctrl-s for save
nnoremap <c-s> :w<cr>
" save and close
nnoremap <leader>w :w<cr>:bw<cr>

" buffer nav
nnoremap <c-h> :bp<cr>
nnoremap <c-l> :bn<cr>


let mapleader = "\<Space>"

" quickly source vimrc with <space> + s
nnoremap <leader>s :source ~/.vimrc<cr>

" prevent the 'no write since last change' message when changing buffers
set hidden
call plug#begin('~/.vim/plugged')
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()
colorscheme tokyonight
