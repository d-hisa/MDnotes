# Android Studio
## 概要
## インストール
## 初期設定
### 日本語化
pleiadesを利用するとよいらしい。
- [Pleiades - 日本語化プラグイン](http://mergedoc.osdn.jp/)より、プラグイン（All in Oneではない）をダウンロード
- 解凍後のフォルダ`plugins/jp.sourceforge.mergedoc.pleiades`を下記ディレクトリにコピー
	+ Win:`C:\Users\USER_NAME\.AndroidStudio2.3\jp.sourceforge.mergedoc.pleiades`
 	+ Mac:`hoge`
- 起動オプションを変更
	+ [Help]->[Edit Custom VM Options...]
	+ 開いたエディタに対して下記ディレクトリの内容をコピペ
		* Win:`C:\program Files\Android\Android Studio\bin\studio64.exe.vmoptions`
		* Mac:`hoge`
	+ 末尾に下記を追記
	```java
	-Xverify:none
	-javaagent:PLEIADES_FULL_PATH/jp.sourceforge.mergedoc.pleiades/pleiades.jar
	// 下記が例
	-javaagent:C:\Users\USER_NAME\.AndroidStudio2.3\jp.sourceforge.mergedoc.pleiades\pleiades.jar
	```
- 再起動

> Reference
> - [Android Studio / IntelliJ IDEA の日本語化と設定 - Qiita](http://qiita.com/cypher256/items/a87179fbe8dd7f63ec4e)

### 見た目の設定
- [ファイル]->[設定] or <kbd>Ctrl + Alt + S</kbd>
- [外観]->[ルック＆フィール]
	+ IntelliJ:白ベース
	+ Darcula:黒ベース
	+ Windows:クソダサ

### フォント設定
FilaCodeとリガチャを設定する。
- [ファイル]->[設定]->[エディタ]->[色とフォント]->[色とフォント]->[フォント]
- [スキーム]->[別名保存]  
で名前をつける
- [等幅フォントのみ]のチェックを外す
- 適当なフォントを設定
- リガチャを有効にし、適用

### Git（ssh）を使えるようにする
sshを使っているgitリポジトリだと、fetchとかに失敗する場合がある。
- [ファイル|File]->[設定｜Preferences]->[バージョン管理|VersionControl]->[Git]
- [SSH実行可能ファイル|SSH executable]を[ビルトイン|Built-in|ビルトイン]から[ネイティブ|Native]ネイティブに変更
- あとは、`.ssh`とかにid_rsaとかで鍵が置いてあれば多分大丈夫。


## 詳細設定
## 使い方
### 全てのファイルから検索する
- Win:<kbd>Ctrl + Shift + F</kbd> / Mac:<kbd>Cmd + Chift + F</kbd>
- プロジェクトを右クリック->[Find in path...]
### エミュレータにプロキシ設定をする
コンソールで立ち上げ時にproxyオプションを設定する。
```bash
$ emulator -list-avds
HOGE_API_XX
FOO_API_XX
...
$ emulator -avd EMULATOR_NAME -http-proxy YOUR_PROXY:YOUR_PORT
```
