scriptencoding utf-8
set enc=utf-8
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default
"---------------------------------------------------------------------------
"カラースキーム変更
syntax on
set termguicolors
"---------------------------------------------------------------------------
"バックアップ
set backup
set backupdir=~/VimBackUp/

""" Swap file settings (.file.txt.swp)
set swapfile
set directory=~/VimBackUp/

""" Undo file settings (.file.txt.un~)
set undofile
set undodir=~/VimBackUp/
"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set nosmartcase
"ビジュアルモードで選択した部分を検索
vnoremap * "zy:let @/ = @z<CR>n
"---------------------------------------------------------------------------
" 編集に関する設定:
"
"CTRL-Xで減算できるようにする
silent! vunmap <C-X>
"空行を挿入
nnoremap o o<ESC>
nnoremap O O<ESC>
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
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"検索結果のハイライトと取り消し
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<CR>
set incsearch
"全角スペースの可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"括弧,クォーテーションの補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ｛ {}<Left>
inoremap （ ()<ESC>i
inoremap （ ()<LEFT>
inoremap ” ""<LEFT>
inoremap ’ ''<LEFT>

"全角数字の補完
inoremap ０ 0
inoremap １ 1
inoremap ２ 2
inoremap ３ 3
inoremap ４ 4
inoremap ５ 5
inoremap ６ 6
inoremap ７ 7
inoremap ８ 8
inoremap ９ 9
"ノーマルモードで: を;に置き換える"
noremap ; :
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
"ウィンドウの下にterminalを開く"
set splitbelow
"terminalのサイズ指定"
set termwinsize=10x0
"bashを開く
nnoremap gs :term ++close bash<CR>
nnoremap gr :Rgrep <CR>
nnoremap gf <C-W>gf
"ビジュアルモードでインデント変更時モードを抜けないようにする
vnoremap < <gv
vnoremap > >gv
"日付の入力
nnoremap da a<C-R>=strftime("%Y/%b/%d")<CR><ESC>
"ファイルパスをクリップボードにコピー
nnoremap yp :let @+=expand("%")<CR>
nnoremap yfp :let @+=expand("%:p")<CR>
"インデントを自動で調整
nnoremap <C-F> i<C-F><ESC>
"----------------------------------------------------------"
"emacs移動
" insert mode
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
"-----------------------------------------------------------
"tagジャンプ
set tags=tags;
nmap <F8> :TagbarToggle<CR>
"-----------------------------------------------------------
"grepのパス
"C:\MinGW\bin\egrep.exe
let Grep_Path = 'C:\MinGW\bin\egrep.exe'
let Egrep_Path = 'C:\MinGW\bin\egrep.exe'
let Fgrep_Path = 'C:\MinGW\bin\fgrep.exe'
let Agrep_Path = 'C:\MinGW\bin\agrep.exe'
let Grep_Find_Path = 'C:\MinGW\bin\find.exe'
let Grep_Xargs_Path = 'C:\MinGW\bin\xargs.exe'
let Grep_Options = '-i'
let Grep_Shell_Quote_Char = '"'
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
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
set listchars=tab:>-,extends:<,trail:~,eol:<,nbsp:%
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
"-----------------------------------------------------------
if &compatible
	set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

	call dein#add('preservim/nerdtree')
	call dein#add('jistr/vim-nerdtree-tabs')
	call dein#add('mechatroner/rainbow_csv')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

"-----------------------------------------------------------
"nerdtree-tab設定
let g:nerdtree_tabs_open_on_console_startup=1
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"-----------------------------------------------------------
"カレントウィンドウ以外暗くする
autocmd ColorScheme * highlight NormalNC guifg=#a0a0a0 guibg=#121212
autocmd WinEnter,BufWinEnter * setlocal wincolor=
autocmd WinLeave * setlocal wincolor=NormalNC
