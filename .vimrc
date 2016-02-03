set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'tomasr/molokai'
NeoBundle 'tyru/caw.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \'build' : {
      \    'windows' : 'tools\\update-dll-mingw',
      \    'cygwin' : 'make -f make_cygwin.mak',
      \    'mac' : 'make',
      \    'linux' : 'make',
      \    'unix' : 'gmake',
      \   },
      \}
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

" For Statusline
set laststatus=2
set showtabline=2
set noshowmode

" Lightline.vim
let g:lightline = {
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


nnoremap <silent><C-e> :NERDTreeToggle<CR>

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

au BufRead,BufNewFile */nginx/*.conf set ft=nginx
