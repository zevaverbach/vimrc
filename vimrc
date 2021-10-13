" avoid 'X more file(s) to edit'
filetype on
set nocompatible
set confirm

" prevent the 'no write since last change' message when changing buffers
set hidden

"-- Find --
set path=**                        "set find path to current directory
set suffixesadd=.py,.html,.css,.js,.scss,.less     "add sufixes so you don't have to type whole filenames

"-- Autocomplete on command mode --
set wildmode=full                  "autocomplete filenames, help, etc.
set wildmenu                       "shows autocomplete options in a nice menu list
set wildignore=*.swp,*.bak,*.pyc   "ignore certain file types in autocompletion

" Reopen the last edited position in files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set history
" undo persists after quit
set undofile
set undodir=$HOME/.vim/undo

" italicize comments
highlight Comment cterm=italic gui=italic

set relativenumber
" four-space tabs
filetype indent plugin on
set smartindent
set autoindent

set title                          " set the terminal title
set ruler                          "show status line
set rulerformat=%10(%l,%c%V%)
set laststatus=2                   "always show status line
set cursorline                     "highlight current line

set ignorecase                     "case-insensitive search
set smartcase                      "unless there's an uppercase letter in the keyword

setlocal shiftwidth=2 softtabstop=2 expandtab
au FileType python setl softtabstop=4 shiftwidth=4 tabstop=4

" toggle paste mode
map <Leader>p :set invpaste<CR>

" keep visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" easier completion mode
imap <c-k> <c-x>

" quick way to escape insert mode
inoremap kj <ESC>                  
inoremap <S-Space> <ESC>

" make <tab> jump you to the matching bracket in normal or visual modes
nnoremap <tab> %
vnoremap <tab> %

" easier way to get to beginning end of line
map H ^
map L $
let mapleader = "\<Space>"
 
" toggle comment
nnoremap <c-/> gc

" save all and quit
nnoremap <leader>q :wa<cr>ZQ
" save
nnoremap <c-s> :w<cr>
" save and close buffer
nnoremap <leader>w :w<cr>:bw<cr>
nnoremap <c-h> :bp<cr>
nnoremap <c-l> :bn<cr>
" clear highlights
nnoremap <c-e> :noh<cr>
nnoremap <leader>p :PlugInstall<cr>

nnoremap <buffer><silent> <leader>f <cmd>call Black()<cr>

" show number of lines in buffer
nnoremap <leader>l :echo line("$")<cr>

" quickly source vimrc with <space> + s
nnoremap <leader>s :source ~/.vimrc<cr>

let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'
let g:black#settings = {
    \ 'fast': 1,
    \ 'line_length': 100
\}

call plug#begin('~/.vim/plugged')
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'tpope/vim-commentary'
call plug#end()

colorscheme tokyonight
