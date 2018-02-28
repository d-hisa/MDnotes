# Mac OS Tips
## Console Name Castomize
```bash
[.bash_profile]
# For Console Present Name Chnage
PS1="\u:\[\033[32m\]\W\[\033[0m\] $"

```
詳細は以下参照のこと。
- [[Mac] ターミナルの$前の出力内容をカスタマイズする - YoheiM .NET](http://www.yoheim.net/blog.php?q=20140309)

> **NOTICE**
こういう便利なWEBページがあった
[Easy Bash Prompt Generator](http://ezprompt.net/)


## Settings
### Caps exchange Esc
- システム環境設定->キーボード->[キーボード]->修飾キー
- Capsキーをプルダウンで入れ替え

## Finderで不可視ファイル（.ファイル）を表示する
以下のコマンドを叩く
```bash
# default設定を変更
$ defaults write com.apple.finder AppleShowAllFiles TRUE
# プロセスを殺してFinderを再起動
$ killall Finder
```

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
### Exiftool
exif情報をあれこれするツール
```bash
# Install
$ brew install exiftool
# exif情報を確認
$ exiftool FILE_NAME
# exif情報を削除(ワイルドカードOK)
$ exiftool all= FILE_NAME
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

## Tips
### Wi-Fiの優先順位を設定する
- システム環境設定
	- ネットワーク
		- Wi-Fi
			- 詳細...
				- 表示されているアクセスポイントの一覧をドラッグ&ドロップで入れ替えることで、上にあるAPほど優先的に接続される

### スクリーンショット
#### デスクトップへ保存
- cmd shift 3:デスクトップ全体
- cmd shift 4:範囲指定モード
    - Space:ウィンドウモード
#### クリップボード
ctrlキーを足すとクリップボードになる

### 開発元が信頼できないときの開き方
`control + 開く`で一度開けば今後聞かれない。
### 容量が逼迫してくる時に試すこと
#### Xcode
**CoreSimulator**  
`~/Library/Developer/CoreSimulator/Devices`以下にiOSのバージョンと機種ごとのシミュレータ（？）が入ってる。  
古いバージョンとかがたくさん残っていて、でかい。
```bash
$ xcrun simctl list
== Device Types ==
iPhone 4s (com.apple.CoreSimulator.SimDeviceType.iPhone-4s)
iPhone 5 (com.apple.CoreSimulator.SimDeviceType.iPhone-5)
iPhone 5s (com.apple.CoreSimulator.SimDeviceType.iPhone-5s)
~~
== Runtimes ==
iOS 9.2 (9.2 - 13C75) (com.apple.CoreSimulator.SimRuntime.iOS-9-2)
tvOS 9.1 (9.1 - 13U78) (com.apple.CoreSimulator.SimRuntime.tvOS-9-1)
watchOS 2.1 (2.1 - 13S660) (com.apple.CoreSimulator.SimRuntime.watchOS-2-1)
== Devices ==
-- iOS 9.2 --
    iPhone 4s (2913BDFC-A14F-410C-A91A-8F9E4932E96D) (Shutdown)
    iPhone 5 (2E630D90-8E4B-43E0-8E75-AB60C1250126) (Shutdown)
~~
...
```
シミュレータにインストールされているアプリの削除、リセット（シミュレータ自体は残ったまま）
```bash
$ xcrun simctl erase 358B0474-9C7F-4EB7-AA1A-0AC970917081
```
> リンク  
[iOS開発していて気がついたら一杯のハードディスクを20GB以上軽くする方法！ - Qiita](http://qiita.com/reikubonaga/items/48987d35fb10b7de6bcc)


#### Homebrew
brewでインストールしたファイルは`/usr/local/Cellar`以下に入っているが、`brew update`などをしていると古いバージョンが残っていて（？）、それが積み重なって結構な容量になる。  
`brew cleanup [target]`で、最新版以外を削除する  
```bash
$ brew ls --versions | grep mysql  # 例えば`mysql`を見てみる
mysql 5.6.10 5.6.17_1 5.6.21 5.6.22 5.6.25 5.6.26 5.7.10
$ ls /usr/local/Cellar/mysql
5.6.10          5.6.21          5.6.25          5.7.10
5.6.17_1        5.6.22          5.6.26
$ brew cleanup mysql  # 古いバージョンを削除
Removing: /usr/local/Cellar/mysql/5.6.10... (9,246 files, 327.4M)
~~
Removing: /usr/local/Cellar/mysql/5.6.26... (9,853 files, 314.0M)
==> This operation has freed approximately 1.9G of disk space.
$ brew ls --versions | grep mysql
mysql 5.7.10  # 綺麗になりました
$ ls /usr/local/Cellar/mysql
5.7.10
```
対称を指定しなければ、すべてのモジュールが対象になる：
```bash
$ brew cleanup -n  # ドライラン
Would remove: /usr/local/Cellar/ant/1.9.4 (1,597 files, 35.8M)
Would remove: /usr/local/Cellar/ant/1.9.5 (1,606 files, 34.8M)
==> This operation would free approximately 4.5G of disk space.
...
$ brew cleanup  # クリーンナップ！
...
==> This operation has freed approximately 4.5G of disk space.
```
**ダウンロードしたファイル**  
`/Library/Caches/Homebrew`以下にダウンロードされた`.tar.gz`が入っている
```bash
$ rm -rf `brew --cache`
```

#### .m2 repository
Apache Maven? Eclipse?
`~/.m2/repository/.cache/m2e` 以下

#### iTunes
iPhoneなどからバックアップしたアプリが保存される。
- `~/Music/iTunes/iTunes Media/Mobile Applications/`
	* iTunesを開いて、Apps > マイ Appで、アプリのアイコンを右クリック > 削除 > ゴミ箱に入れる
- `~/Music/iTunes/Album Artwork/`
	* 自分の場合iTunesで曲を保持してないので、Album Artworkフォルダごと削除してしまっても、次回iTunesを立ち上げた時に自動的に再度フォルダは作られて問題ないように見える

#### gradle
- `~/.gradle`
	* wrapper/dists, cacheなど、古いバージョンなども残っている模様
	* ~/.gradle ごと削除してしまってよいとか（やってはみたが、不具合は未確認）

#### node.js
- nvm
	* インストールされているバージョンをリストアップ： nvm ls
	* 各nodeのバージョンのインストール先： ~/.nvm/versions/node/
	* 使わなくなったバージョンのアンインストール： nvm uninstall <バージョン>
- npm
	* グローバルにインストールされているパッケージをリストアップ： npm -g ls
	* インストール先：　nvm を使っている場合、~/.nvm/versions/node/<バージョン>/lib/node_modules/
	* グローバルのパッケージをアンインストールするには： npm -g uninstall <パッケージ>

#### Ruby
- rbenv
	* バージョンをリスト： rbenv versions
	* インストール先： /usr/local/rbenv/versions/
	* アンインストール： rbenv uninstall <バージョン>
- gem
	* リスト： gem list
	* インストール先： /usr/local/rbenv/versions/<バージョン>/lib/ruby/gems/<バージョン>/gems/
	* 不要な古いバージョンを削除： gem cleanup
	* `--dryrun` をつけて確認してからが吉
