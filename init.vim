" CURRENT NVIM SETTINGS

" BASICS

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
" set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
" set nowrap
set incsearch
set scrolloff=8
set linebreak

" set termguicolors
" set colorcolumn=72
" set textwidth=72
set nojoinspaces
" set signcolumn=yes
set inccommand=

" SEARCHING

" set path+=**
set wildmenu 
set wildignorecase

" CLIPBOARD

set clipboard=unnamedplus 

" PLUGINS

" Change to current directory and back to home

" nnoremap <F7> :lcd %:p:h<CR>
" nnoremap <F8> :cd ~/<CR>

" Run bash script under cursor

" nnoremap <F6> :.w !bash<CR>

" Regex, list capital words at the beginning of a line (cheap toc)

" nnoremap <F9> :vimgrep /^[A-Z][A-Z\w]/
" nnoremap <F9> :vimgrep /^\w[A-Z]\+/

" Theme
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-o> :Buffers<CR>

" THEME

" set background=dark
" colorscheme gruvbox

" KEYMAPPING

let mapleader = ","
imap jj <Esc>

nnoremap j gj
nnoremap gj j

nnoremap k gk
nnoremap gk k

