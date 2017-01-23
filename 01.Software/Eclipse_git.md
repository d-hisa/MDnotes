# eclipseでgitするメモ
## Summary
Eclipseのプラグイン（Egit)を使ってEclipseのプロジェクトをバージョン管理してみるTips。

## EclipseでローカルにGitする
### プラグインの導入
+ [Help]->[install New Software...]
+ 上段のテキストボックス[Workwith]に以下を記入  
`Mars - http://download.eclipse.org/releases/mars`
+ [Collaboration]->[Eclipse Git Team Provider - Gitflow support	\*.\*\*.\*\*]を選択
+ あとは流れで（ここやたら時間かかるけど気長に）
### Gitリポジトリの設定
+ [Window]->[Perspective]->[Open perspective]->[Other...]
+ [Git]を選ぶとwindowが変わる。このとき、前の画面に戻したければ画面右上にある[Java]ボタンを押す
 	* これがパースペクティブと呼ばれているものらしい
+ 左のペインの[Create a new local Git repository]をクリック
+


## Reference
+ [EclipseにGitプラグインを導入して、ローカルにあるプロジェクトをコミット１](http://bukinasi-se-biboroku.blog.so-net.ne.jp/2015-11-23)  
メインのリファレンス
+ [Undertree's Lab: Eclipse Indigoのネットワーク設定](http://undertrees-lab.blogspot.jp/2011/08/eclipse-indigo_31.html)  
Eclipseにproxyを通すTips。これをやらないと社内だと永遠に終わらない問題

## あとで確認
- [Eclipse で Git を使う - アンドロイドプロジェクトのリポジトリ作成 - Android 開発入門](http://android.keicode.com/devenv/git-eclipse-android.php)
- [Eclipse EGit の使い方(1/2) | hiromasa.another :o)](http://another.maple4ever.net/archives/2060/)
-

## Change Log
### ver.1.0
+ 初版
+
