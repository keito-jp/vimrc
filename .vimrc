set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nathanaelkane/vim-indent-guides'
call neobundle#end()

filetype plugin indent on
syntax on

colorscheme molokai

set hlsearch
set ignorecase
set smartcase
set noincsearch
set cursorline
set title
set showmatch

set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=0
set smarttab

set list
set listchars=tab:>-,trail:-

set ruler
set number

set cindent
set showcmd
set nobackup

set clipboard=unnamed,autoselect

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  guibg=black   ctermbg=234
hi IndentGuidesEven guibg=gray ctermbg=239

nnoremap <silent><C-e> :NERDTreeToggle<CR>

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
