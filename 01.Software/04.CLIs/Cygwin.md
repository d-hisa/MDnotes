# Cygwinを使ってみる
## Introduction
WindowsでUNIXをなんかするコンソールらしい。  
PuttyもTeratermもいらんとか言われてる。  

## Install
1. [Cygwin公式サイト](https://cygwin.com/index.html)からダウンロード  
左メニューの`Install Cygwin`の`Installing and Updating Cygwin for 64-bit versions of Windows`の`setup-x86_64.exe`
1. チャートに従ってインストール（以下のリストは一画面ずつ）  
	+ `Install from Internet`
	+ `Root`ディレクトリはそのまま(`C:\cygwin64`,の場合はx86`C:\cygwin`)
	+ `Select Local Package Directory`は`C:\cygwin64\packages`がお勧め  
	でてくるアラートは`はい`  
	+ 社内で入れる場合は`Use Internet Explorer Proxy Setting`をしないと漏れなく死ぬ
	+ `Choose A Download Site`では日本のjpドメインを選ぶのが吉。  
	この時点でリストが真っ白ならProxyを確認して合っててもダメなら**あきらめろ**  
	今回は安心と信頼と実績の`ftp://ftp.jaist.ac.jp`を選択
	+ 急に最大画面になってびっくりするけど臆さずに。特に入れたいパッケージが無いならスルー、Vim入れたければ`Editors`をブレークダウンして`vim: Vi IMproved - enhanced vi editor`を探す。  
	`Skip`をクリックすると`Bin?`カラムにチェックが入るはず。
	> なぜかviは使えるけどvimはあかんっぽい･･････
	+ `Resolving Dependencies`では入れるパッケージが一覧。Vimの依存元とかも勝手に入れてくれるらしい。

これで大体終わり。
## How to use
Cygwinを起動するとminittyというコンソールが起動する。  
linuxがエミュレートされていて、このときのルートディレクトリはcygwinをインストールした先（今回はココ：`C:\cygwin64`）。  
### Win環境への移動(cygdrive)
そのままでは`cd ../`とかでcygwin以上のディレクトリに移動することはできない。  
`cygdrive`コマンドでドライブをマウントする。
#### cygdrive
記法的には`cygdrive/DRIVE_ID`でマウントする感じ。

```bash
$ cd /cygwin/c/users/USERNAME/desktop
```

とかってすると、USERNAMEアカウントのデスクトップまで飛ぶ。

#### cygstart
ファイルをWindowsの規定のプログラムで開いてくれるコマンド。  
```bash
$ cygstart sample.txt
```
とかってやると、規定がnotepadならnotepadで普通に起動する。  
```bash
$ cygstart .
```
とかディレクトリを指定するとエクスプローラで開く。地味に便利かも。  
OpenでエイリアスしとくとMacライクに使えそう。

## Reference
+ [Cygwin(64bit)とgitのインストール - Qiita](http://qiita.com/kanpou_/items/0764381301d37e04157b)
+ [開発ツール/Cygwinにvimエディタをインストールする - Windowsと暮らす](http://win.just4fun.biz/%E9%96%8B%E7%99%BA%E3%83%84%E3%83%BC%E3%83%AB/Cygwin%E3%81%ABvim%E3%82%A8%E3%83%87%E3%82%A3%E3%82%BF%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%99%E3%82%8B.html)

## Unfixed isssues
+ pingをたたくと文字化け(lsとかで日本語ファイル読めるし、viで日本語ファイルも開けるのに)
