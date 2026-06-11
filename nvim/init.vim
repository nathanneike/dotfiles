set number
syntax on

call plug#begin()

Plug 'm4xshen/hardtime.nvim'
Plug 'MunifTanjim/nui.nvim'

call plug#end()

set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

let mapleader=" "

set undofile

syntax on

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :wq<CR>

set clipboard+=unnamedplus
lua << EOF
require("hardtime").setup()
EOF
