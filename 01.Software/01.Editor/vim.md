# Vimまとめ
## .vimrc
特にWinでcmderとか使ってvimする場合には、文字化けを避けたりと必須な項目もあるので、要設定
```py
"--- Line Number default present ---
set number
"--- Auto indent when paste and break, etc. ---
set smartindent

"--- ForWin: Set CharCode default UTF-8 ---
set encoding=utf-8
"--- ForWin: Set file auto recognizing ---
set fileencodings=cp932,sjis,utf-8

"--- ForMac: iTerm2 enabling syntax highlight ---
set term=xterm-256color
set syntax
```

## dein
新世代Vim用パッケージマネージャ。らしい。
### Installation
#### 1. curl and exec shellscript
```bash
$ mkdir -p ~/.cache/dein
$ cd ~/.cache/dein
$ export https_proxy=PROXY_HOST:PROXY_PORT	# proxy環境下の場合、curlにproxyを通す必要あり
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.cache/dein
```
#### 2. .vimrc add
##### 通常使用時
インストール時に出てくるやつをコピペするのが本来らしいけど、そのままだとうまく動かないので以下のをコピペしよう
```py
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/USER_NAME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/Users/USER_NAME/.cache/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

//If you ...から下の部分のコメントアウトを外しておく
" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
```

##### tomlを使う場合の例
```py
[.vimrc]
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
```
#### 3. toml file adding
```bash
そのうち…
```

### dein plugins
- NERDTree


### Reference
- [NeoBundle から dein.vim に乗り換えたら爆速だった話 - Qiita](http://qiita.com/delphinus/items/00ff2c0ba972c6e41542)
- [dein.vimを使ってみる - Qiita](http://qiita.com/yoza/items/2f8bd33a18225754f346)
- [dein.vimのインストール自体にハマってしまったメモ - Qiita](http://qiita.com/DialBird/items/0a96910f13586d635dc0)
- [dein.vimによるプラグイン管理のマイベストプラクティス - Qiita](http://qiita.com/kawaz/items/ee725f6214f91337b42b)


## Other tips
### vim のカラーシンタックスの関連ファイルを指定する
- `~/.vim/filetype.vim`を作る。
- 上記ファイルに以下を記述
```bash
augroup filetypedetect
  au BufRead,BufNewFile *.hoge setfiletype foovar
augroup END
```
で`.hoge`ファイルに`foovar`のカラーシンタックスが適用される。らしい。
### Vimの各ディレクトリ（.vimrcの場所とか）を確認するTips
コマンドラインから、`vim -version`とすれば、ディレクトリが現れる（ハズ）
## Vimでテキストを暗号化する
暗号化前のテキストを開き、`:X PASSWPRD`として、`:wq`すると暗号化される。  
暗号化を解除するにはファイルを開いた状態で`:X`とするだけ。

## vimdiff
```bash
$ vimdiff FILE1 FILE2
```
### command
- `dp`:右方向へのmerge
- `do`:左方向へのmerge

## vim study
vimの使い方的なとこ
### 矩形選択
- <kbd>Ctrl + V</kbd> -> [VISUAL BLOCK] mode
- <kbd>Shift + i</kbd>
- insert words
- <kbd>Esc</kbd>
### tab
```bash
:tabnew | edit /hoge/path
```

### directory tree
```bash
:edit .
```
**keybinds**  
- `enter`: open directory
- `-`:move parent directory
- `d`: make directory
- `D`:file / directory delete
-`R`: file/directory rename
