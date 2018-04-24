set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin('~/.vim.bundle/Vundle.vim')


Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'mattn/emmet-vim'
Plugin 'tomasr/molokai'
Plugin 'Yggdroot/indentLine'
Plugin 'Shougo/unite.vim'

call vundle#end()
filetype plugin indent on

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
" set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示(縦)
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 改行時に前の行のインデントを継続する
set autoindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
"set showmatch
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" スクロールするときに下が見えるようにする
set scrolloff=5

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" カラースキーム
syntax on
colorscheme molokai
" 背景透過
" テキストの背景
highlight Normal ctermbg=none
" テキストの下の余白
highlight NonText ctermbg=none
" 行番号
highlight LineNr ctermbg=none
" コマンド折りたたみ
highlight Folded ctermbg=none
" ファイルの終わり以降の空白
highlight EndOfBuffer ctermbg=none
" ダーク系のカラースキームを使う
"set background=dark

" コマンドモードの補完
set wildmenu
" 保存するコマンド履歴の数
set history=5000
" ペースト設定
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
" 矢印キーを無効にする
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>
"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>
" jjでESｃ
inoremap <silent> jj <ESC>
" insert mode でも hjklで移動
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

"BackSpace Delete設定
"imap <C-u> <BS>
"imap <C-i> <Del>

"現在行の下に空行を挿入
"imap <C-o> <ESC>o

"--------------------------
"emmet の設定
let g:user_emmet_leader_key = '<c-e>'
let g:user_emmet_settings = {
\   'variables' : {
\   'lang': "ja"
\   }
\}
"-------------------------

filetype plugin indent on

"-------------------------
"<C-y>で拡張子に応じたコマンドを自動打ち込み、エンターで実行
autocmd BufNewFile,BufRead *.py nnoremap <C-y> :!python3 %
