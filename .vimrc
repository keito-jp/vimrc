set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'tomasr/molokai'
NeoBundle 'tyru/caw.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Shougo/vimproc.vim', {
      \'build' : {
      \    'windows' : 'tools\\update-dll-mingw',
      \    'cygwin' : 'make -f make_cygwin.mak',
      \    'mac' : 'make',
      \    'linux' : 'make',
      \    'unix' : 'gmake',
      \   },
      \}
NeoBundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
NeoBundleLazy 'Shougo/unite.vim', {
      \  'autoload' : {
      \    'commands' : [ 'Unite' ]
      \  }
      \}
NeoBundleLazy 'tpope/vim-endwise', {
      \  'autoload' : {
      \    'insert' : 1
      \  }
      \}
NeoBundleLazy 'slim-template/vim-slim', {
      \  'autoload' : {
      \    'filetypes' : [ 'slim' ]
      \  }
      \}
NeoBundleLazy 'vim-scripts/nginx.vim', {
      \  'autoload' : {
      \    'filetypes' : [ 'nginx' ]
      \  }
      \}
NeoBundleLazy 'kchmck/vim-coffee-script', {
      \  'autoload' : {
      \    'filetypes' : [ 'coffee' ]
      \  }
      \}
NeoBundleLazy 'groenewege/vim-less', {
      \  'autoload' : {
      \    'filetypes' : [ 'less' ]
      \  }
      \}
NeoBundleLazy 'scrooloose/nerdtree', {
      \  'autoload' : {
      \    'commands' : [ 'NERDTreeToggle' ]
      \  }
      \}
NeoBundleLazy 'supermomonga/jazzradio.vim', { 'depends' : [ 'Shougo/unite.vim' ] }
if neobundle#tap('jazzradio.vim')
  call neobundle#config({
      \  'autoload' : {
      \    'unite_sources' : [
      \      'jazzradio'
      \    ],
      \    'commands' : [
      \      'JazzradioUpdateChannels',
      \      'JazzradioStop',
      \      {
      \        'name' : 'JazzradioPlay',
      \        'complete' : 'customlist,jazzradio#channel_key_complete'
      \      }
      \    ],
      \    'function_prefix' : 'jazzradio'
      \  }
      \})
endif
call neobundle#end()

filetype plugin indent on
syntax on

colorscheme molokai
:hi Directory guifg=cyan ctermfg=cyan

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
" For Powerline
set laststatus=2
set showtabline=2
set noshowmode

nnoremap <silent><C-e> :NERDTreeToggle<CR>

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

au BufRead,BufNewFile */nginx/*.conf set ft=nginx
