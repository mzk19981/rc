scriptencoding utf-8
"---------------------------------------------------------------------------
" エンコード
set enc=utf-8
set fencs='ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default'
" helpを日本語に
set helplang=ja

"---------------------------------------------------------------------------
" バックアップファイル等
" バックアップ
set backup
set backupdir=~/VimBackUp/

" Swap file settings (.file.txt.swp)
set swapfile
set directory=~/VimBackUp/

" Undo file settings (.file.txt.un~)
set undofile
set undodir=~/VimBackUp/

"---------------------------------------------------------------------------
" カラー設定
colorscheme molokai
syntax on
set termguicolors
"---------------------------------------------------------------------------
" 全般
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 記号等の表示設定
set ambiwidth=double
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"CTRL-Xで減算できるようにする
silent! vunmap <C-X>
" ヤンクでクリップボードにコピー
set clipboard=unnamed

"ビープ音
set visualbell t_vb=
set noerrorbells
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を非表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,extends:<,trail:~,eol:↲,nbsp:%
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
"カーソルライン
set cursorline
set cursorcolumn
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" スクロール時に数行余裕を持たせる
set scrolloff=5
" マクロなどで画面の再描画を行わない
set lazyredraw
" ウィンドウの下にterminalを開く"
set splitbelow

"---------------------------------------------------------------------------
"インデント系
" タブの画面上での幅
set tabstop=4
" タブキー押下時に挿入される文字幅を指定
set softtabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" インデント幅
set shiftwidth=4
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent

augroup fileTypeIndent
	autocmd!
	autocmd BufNewFile,BufRead *.hs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	autocmd BufNewFile,BufRead *.can setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab filetype=c
	autocmd BufNewFile,BufRead *.asc setlocal filetype=csv_whitespace
augroup END
"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set nosmartcase
"ビジュアルモードで選択した部分を検索
vnoremap * "zy:let @/ = @z<CR>n
nnoremap / /\v
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
"検索結果のハイライトと取り消し
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<CR>
set incsearch

"---------------------------------------------------------------------------
" key変更

"空行を挿入
nnoremap o o<ESC>
nnoremap O O<ESC>

"括弧,クォーテーションの補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"ノーマルモードで: を;に置き換える"
noremap ; :
"bashを開く
nnoremap gs :term<CR>
nnoremap gr yiw :silent! gr! <C-R>+ ./
nnoremap gf <C-W>gf
"ビジュアルモードでインデント変更時モードを抜けないようにする
vnoremap < <gv
vnoremap > >gv
"日付の入力
inoremap <expr> <C-d> strftime("%Y/%b/%d")
"ファイルパスをクリップボードにコピー
nnoremap yp :let @+=expand("%")<CR>
nnoremap yfp :let @+=expand("%:p")<CR>
"インデントを自動で調整
nnoremap <C-F> i<C-F><ESC>
"emacs移動
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
"-----------------------------------------------------------
"tagジャンプ
set tags=tags;
"-----------------------------------------------------------
set grepprg=egrep\ -rIn\ --exclude=tags
set makeencoding=cp932
au QuickfixCmdPost grep copen

"---------------------------------------------------------------------------
" python PATH
let g:python3_host_prog = 'C:\Python37\python.exe'
"-----------------------------------------------------------
"dein設定

if &compatible
	set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
""
	call dein#add('preservim/nerdtree')
	call dein#add('jistr/vim-nerdtree-tabs')
	call dein#add('mechatroner/rainbow_csv')
	call dein#add('simeji/winresizer')
	call dein#add('vim-jp/vimdoc-ja')
	call dein#add('dhruvasagar/vim-table-mode')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('ryanoasis/vim-devicons')
	call dein#add('pepo-le/win-ime-con.nvim')
	call dein#add('markonm/traces.vim')
	call dein#add('Rasukarusan/nvim-block-paste')
	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

"-----------------------------------------------------------
"ime設定
let g:win_ime_con_mode = 0
"-----------------------------------------------------------
"nerdtree-tab設定
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0
let g:webdevicons_enable_nerdtree = 1
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <F2> :NERDTreeTabsToggle<CR>
"-----------------------------------------------------------
"airline設定
" テーマの指定
let g:airline_theme = 'molokai'
" タブラインを表示
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
