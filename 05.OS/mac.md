# Mac OS Tips
## Console Name Castomize
```bash
[.bash_profile]
# For Console Present Name Chnage
PS1="\u:\[\033[32m\]\W\[\033[0m\] $"

```
詳細は以下参照のこと。
- [[Mac] ターミナルの$前の出力内容をカスタマイズする - YoheiM .NET](http://www.yoheim.net/blog.php?q=20140309)

## Homebrew
### home brew cask
homebrewの経由でもっといろいろインストールできるようにするためのもの？らしい
#### Installation
今のhomebrewにはデフォルトで入ってるっぽい？
### Quicklook markdown
mdファイルをクイックルックできるアプリ。
```bash
$ brew cask install qlmarkdown
```
### Error
#### brew updateが通らない問題
`brew update`すると、やたらと`Permission denied`エラーが出る。  
どうやらEl Capitanへのアプデが悪さしているもよう。  
##### brewディレクトリへ移動してpermissionを確認
```bash
$ cd $(brew --prefix) //デフォルトなら/usr/localになってる
$ pwd
/usr/local
$ cd ../ //localディレクトリのpermissionを見たいので一つ上へ
$ ls -l
~
drwxr-xr-x    18 root  wheel    612 10  5  2015 local
~
```
localディレクトリのユーザ権限が`root`ならアウト。
##### Permissionの変更
お決まりのchownでpermissionを変更。
```bash
# 簡単な方
$ sudo chown -R USER_NAME:admin /usr/local
# Smartなやりかた
$ sudo chown -R $(whoami):admin $(brew --prefix)
```
> `whoami`:はカレントユーザを出力するコマンド。`who`でも似たようなことができるが、`who`は実行中のconsoleとかの実施ユーザまで出せる。

##### gitのリセット
Permissionをクリアしても、まだ`cannot load such file -- mach`的なエラーを吐く。  
なにやらgitのリポジトリが死んでるらしい。
```bash
$ cd $(brew --prefix)
$ git reset --hard && git clean -df
```
でgitのリポジトリ周りをリセット。  
これで`brew update`が通るようになっていればOK。
##### References
[Mac OS X El Capitan にアップデートした後に brew update が動かない場合の対処方法 | gotohayato : ](https://gotohayato.com/content/69)

### Warning
#### Unbrewed dylibs were found in /usr/local/lib.
よくわかんねーlibがあるぞ、というエラーだと思う。    
`Unexpected dylibs:`以下の`hogehoge`ファイルを
```bash
$ rm -rf /usr/local/lib/hogehoge.dylibs
```
してあげればいいっぽい。なお、今回はこのdylibファイル、viとrmは反応したけどlsでは見れず、findでも引っかからなかった。謎。
#### Broken symlinks were found.
シンボリックリンク切れ。以下のコマンドを **brewディレクトリで** 実行すると良い。
```bash
$ brew prune
```
#### References
[Homebrew のエラーとその対処 - ろぼねこの雑記帳 :]( http://roboneco.hateblo.jp/entry/2015/03/13/124536)

##iTerm2
### Shortcuts
- `cmd + k`:clear screen
- `cmd + Enter`:Switch full screen
- `cmd + -`:font size small
- `cmd + shift + ;`:font size big
-
