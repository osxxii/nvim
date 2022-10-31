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
" set termguicolors
" set colorcolumn=72
" set textwidth=72
set nojoinspaces
" set signcolumn=yes
set inccommand=

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

" Change to current directory and back to home

nnoremap <F7> :lcd %:p:h<CR>
nnoremap <F8> :cd ~/<CR>

" Run bash script under cursor

nnoremap <F6> :.w !bash<CR>

" Regex, list capital words at the beginning of a line (cheap toc)

" nnoremap <F9> :vimgrep /^[A-Z][A-Z\w]/
nnoremap <F9> :vimgrep /^\w[A-Z]\+/

" Theme

" Plug 'morhetz/gruvbox'

" Rust and debugging
" https://github.com/simrat39/rust-tools.nvim

" Plug 'neovim/nvim-lspconfig'
" Plug 'simrat39/rust-tools.nvim'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
" 
" Plug 'nvim-lua/plenary.nvim'
" Plug 'mfussenegger/nvim-dap'

" Markdown

" Plug 'plasticboy/vim-markdown'
" Plug 'godlygeek/tabular'

" Writing

" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim' 

call plug#end()

" THEME

" set background=dark
" colorscheme gruvbox

" KEYMAPPING

imap jj <Esc>

nnoremap j gj
nnoremap gj j

nnoremap k gk
nnoremap gk k

" " MARKDOWN
" let g:vim_markdown_new_list_item_indent = 0
" let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'typescript=ts', 'javascript=js']

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

" lua <<EOF
" require('rust-tools').setup(opts)
" require('lspconfig').clangd.setup{}
" require('cmp').setup {
"   sources = {
"     { name = 'nvim_lsp' }
"   }
" }
" 
" 
" -- Mappings.
" -- See `:help vim.diagnostic.*` for documentation on any of the below functions
" local opts = { noremap=true, silent=true }
" vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
" vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
" vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
" vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
" 
" -- Use an on_attach function to only map the following keys
" -- after the language server attaches to the current buffer
" local on_attach = function(client, bufnr)
"   -- Enable completion triggered by <c-x><c-o>
"   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
" 
"   -- Mappings.
"   -- See `:help vim.lsp.*` for documentation on any of the below functions
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
" end
" 
" -- Use a loop to conveniently call 'setup' on multiple servers and
" -- map buffer local keybindings when the language server attaches
" local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
" for _, lsp in pairs(servers) do
"   require('lspconfig')[lsp].setup {
"     on_attach = on_attach,
"     flags = {
"       -- This will be the default in neovim 0.7+
"       debounce_text_changes = 150,
"     }
"   }
" end
" 
" 
" local servers = {'rust_analyzer', 'clangd'}
" 
" -- Add additional capabilities supported by nvim-cmp
" local capabilities = vim.lsp.protocol.make_client_capabilities()
" capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
" 
" for _, lsp in pairs(servers) do
"   require('lspconfig')[lsp].setup {
"     on_attach = on_attach,
"     flags = {
"         capabilities = capabilities,
"       }
"     }
" end
" EOF

" HANDLE SYNTAX

" au BufNewFile,BufRead,BufReadPost *.md set syntax=off

" CTAGS

setlocal tags=./rusty-tags.vi;/
autocmd BufWrite *.rs :silent exec "!rusty-tags vi --start-dir=" . expand('%:p:h') . "&"
