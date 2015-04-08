"------------------NeoBundle ---------------"
set nocompatible              
filetype off                  

if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
endif

"GitHubリポジトリにあるプラグインを利用する場合
NeoBundle 'tpope/vim-fugitive'
"GitHub以外のGitリポジトリにあるプラグインを利用する場合
NeoBundle 'git://git.wincent.com/command-t.git'
"Git以外のリポジトリにあるプラグインを利用する場合
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"neomru
NeoBundle 'Shougo/neomru'

NeoBundle 'git://github.com/Shougo/unite.vim.git'

NeoBundle 'git://github.com/Shougo/vimproc.git'


"--------------- キーバインド ---------------"


"--------------- ステータスライン ---------------"
  "ステータスラインを常に表示"
  set laststatus=2
  "現在のモードを表示"
  set showmode
  "タイプ途中のコマンドを表示"
  set showcmd
  "右下に行，列を表示"
  set ruler


"--------------- encoding ---------------"
  set termencoding=utf-8
  set encoding=utf-8
  set fileformats=unix,dos,mac
  set fileencoding=utf-8
  set fileencodings=utf-8,shift-jis


"--------------- color ---------------"
syntax on
set cursorline
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray

"--------------- other ---------------"
  "TABの幅を指定"
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set shiftround

  "モードライン無効"
  set modelines=0

  "自動でインデント"
  set autoindent

  "行数を表示"
  set number

  "viとの互換なし"
  set nocompatible

  "タイトルをウィンドウ枠に表示" 
  set title

  "検索文字を打ち込むと即検索"
  set incsearch

  "バックスペースで改行とかも消せる"
  set backspace=indent,eol,start

  "バックアップファイルをとらない"
  set nobackup

  "スワップつくらない"
  set noswapfile

  "コマンドラインの履歴"
  set history=500

  "バッファを保存しなくても他のバッファを表示可能に"
  set hidden

  "viminfoファイルの設定"
  set viminfo=!,'50,<1000,s100,\"50"

  "対応する括弧を表示"
  set showmatch

  "補完候補を表示"
  set wildmenu

  "スクロール時の余白確保"
  set scrolloff=7

  "検索結果をハイライト"
  set hlsearch

  "カーソルの下の単語を検索
  vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>


