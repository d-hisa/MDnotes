# Cmder
## 概要

## インストール

## 初期設定

## 追加セットアップ
### MSYS2を追加する
cmderデフォルトの場合、パッケージ管理などができないので、tig等を使うためにMSYS2のbashを追加する。
#### インストール
[MSYS2 homepage](http://www.msys2.org/)からインストーラを入手し、ウィザードに従いインストール
#### Cmderへの設定
- Cmderを起動
- `Setting`->`Startup`->`Tasks`で一覧の`＋`を押下
- `Commands`欄に下記を追記
	* `cmd /C "C:\msys64\usr\bin\bash.exe" --login -i`
- 名前を適当に決めて`Save settings`

#### 初期設定
- ホームディレクトリの設定

- pacmanのアップデート
	* proxyの設定  
	`export http_proxy=YOUR_PROXY:YOUR_PORT`でなんとかなる
	* pacmanのアップデート
	`$ pacman -Syu`
atodeyomu
[Windowsでgccなどを利用できるMSYS2の環境設定など - Qiita](http://qiita.com/chromabox/items/fd07bad3f426101fc4a6)
[msys2 + pacmanをproxy環境で使う - なんとな～くしあわせ？の日記](http://nantonaku-shiawase.hatenablog.com/entry/2014/10/11/163342)

#### パッケージインストール
```bash
$ pacman -S [PACKAGE_NAME]
```
- vim
- tig


#### References
- [MSYS2 homepage](http://www.msys2.org/)
- [MSYS2でWindows上にコマンドライン環境を作る - Qiita](http://qiita.com/nana4gonta/items/717a4508fa585a454690)
