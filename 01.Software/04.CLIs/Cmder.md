# Cmder
## 概要

## インストール

## 初期設定

## 追加セットアップ　～MSYS2を追加する～
cmderデフォルトの場合、パッケージ管理などができないので、tig等を使うためにMSYS2のbashを追加する。
### インストール
[MSYS2 homepage](http://www.msys2.org/)からインストーラを入手し、ウィザードに従いインストール
### Cmderへの設定
- Cmderを起動
- `Setting`->`Startup`->`Tasks`で一覧の`＋`を押下
- `Commands`欄に下記を追記
	* `cmd /C "C:\msys64\usr\bin\bash.exe" --login -i`
- 名前を適当に決めて`Save settings`

### 初期設定
#### ホームディレクトリの設定
* msys上で`/etc/fstab`に以下を追記
* `C:\Users /home`
* これをしないとユーザフォルダに置いてある`.bash_profile`とかを読んでくれない

#### pacmanのアップデート
* proxyの設定  
`export http_proxy=YOUR_PROXY:YOUR_PORT`でなんとかなる
* pacmanのアップデート
`$ pacman -Syu`

#### Windows環境変数の引き継ぎ
```bash
$ vim /etc/profile
[/etc/profile]
~
#### For PATH settings by users ####
MSYS2_PATH_TYPE="inherit"
# ↓の前に↑を足す！
#case "${MSYS2_PATH_TYPE:-minimal}" in
	strict)
~
[end]
```
これでWindows側のPATH設定が引き継げる
atodeyomu
[Windowsでgccなどを利用できるMSYS2の環境設定など - Qiita](http://qiita.com/chromabox/items/fd07bad3f426101fc4a6)
[msys2 + pacmanをproxy環境で使う - なんとな～くしあわせ？の日記](http://nantonaku-shiawase.hatenablog.com/entry/2014/10/11/163342)

### パッケージインストール
```bash
$ pacman -S [PACKAGE_NAME]
```
- vim
- tig
- tar
- gcc
- make

#### nkf
**prerequrements**  
gcc, make, wget, tar
```bash
# Downloads (must checking latest urls for nkf page)
$ wget https://osdn.jp/projects/nkf/downloads/64158/nkf-2.1.4.tar.gz
$ tar zxvf nkf-2.1.4.tar.gz
$ cd nkf-2.1.4
$ make
$ mkdir /usr/local/bin
$ make install
```
[nkf Network Kanji Filter - OSDN](https://ja.osdn.net/projects/nkf/releases/)

### How to pacman
-S:install
-Ss:リポジトリでパッケージを検索
-Qs:ローカルソフト検索
-R:パッケージ削除
-Rs:依存パッケージ共々削除

### tips
#### tigが動かない
- `C:/msys64/usr/bin/tig.exe: error while loading shared libraries: msys-readline7.dll: cannot open shared object file: No such file or directory`
- 上記のようなエラーメッセージが出た場合、`msys/libreadline-devel 7.0.003-1 (development)`パッケージをインストールする。
- `$ pacman -S  msys/libreadline-devel`

#### tigが文字化けする
- `Ncurses`というライブラリがマルチバイト文字にうまくないらしい。
	* enable-widecオプションをつけてmakeしてあげる？
	```bash
	$ wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.0.tar.gz
	$ tar xzvf ncurses-6.0.tar.gz
	$ cd ncurses-6.0/
	$ ./configure  --enable-widec
	```
- TODO:要検証

### References
- [MSYS2 homepage](http://www.msys2.org/)
- [MSYS2でWindows上にコマンドライン環境を作る - Qiita](http://qiita.com/nana4gonta/items/717a4508fa585a454690)

***
aaaa
---
bbbbb
___
cccc
