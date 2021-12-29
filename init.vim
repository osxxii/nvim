" CURRENT NVIM SETTINGS

" BASICS

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
" set nowrap
set incsearch
set scrolloff=8
set linebreak
set termguicolors
" set colorcolumn=80
" set signcolumn=yes

" SEARCHING

set path+=**
set wildmenu 
set wildignorecase

" CLIPBOARD

set clipboard=unnamedplus 

" PLUGINS

" Install vim-plug if not found

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/unegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

" Theme

Plug 'morhetz/gruvbox'

" Rust and debugging
" https://github.com/simrat39/rust-tools.nvim

Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'

" Markdown

Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

" Writing

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim' 

call plug#end()

" THEME

set background=dark
colorscheme gruvbox

" KEYMAPPING

imap jj <Esc>

nnoremap j gj
nnoremap gj j

nnoremap k gk
nnoremap gk k

" MARKDOWN
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'typescript=ts', 'javascript=js']

" LSP RUST

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration

lua <<EOF
require('rust-tools').setup(opts)
EOF

