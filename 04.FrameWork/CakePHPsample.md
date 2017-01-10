# Cakeのサンプル的なSomething
## サンプル
`ikusei-10-pro-aweb-001`上にCakeのサンプル的なのを配置  
元ネタはここ→[自習用に超簡単なサンプルを書いてみた – 端くれプログラマの備忘録](http://www.84kure.com/blog/2014/09/27/cakephp-%E8%87%AA%E7%BF%92%E7%94%A8%E3%81%AB%E8%B6%85%E7%B0%A1%E5%8D%98%E3%81%AA%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%82%92%E6%9B%B8%E3%81%84%E3%81%A6%E3%81%BF%E3%81%9F/)  
中身はこのページを見てね  

## サンプルの概要
+ ユーザのIDをヒモ付けて呟きをDBへ入れていき、それを表示するものらしい。  ｋｗｓｋは上のページを見て
+ 一応ModelとViewとControllerを使っていたのでメモ。
+ ただ、仕組みが良くわかってないので現状ではPostの一覧が見れるだけ。

## 注意点
+ よくわかんないままコピペしたもの。いいサンプルかどうかは正直微妙かも
+ 内容を全く把握せずに勘で構築したのでなんとなくで見てください

## サンプルのディレクトリ構造
足したやつ、関係あるやつだけ抜粋
```bash
/var/www/cakephp/app/
├── Config
│   └── database.php	#DBの設定を書くとこ
├── Controller
│   ├── HomeController.php	#各コントローラ
│   ├── PostsController.php
│   └── UsersController.php
├── Model
│   ├── Post.php	#Post（つぶやき）のモデル
│   └── User.php	#Userのモデル。今回は機能してない
└── View
    └── Home
        └── index.ctp	#最初に表示されるView
```
## 使ったDB
pro-aweb-001にあるmysqlの中にある。  
rootユーザでPassもrootで入れる。
+ DB : cake_sample
	- table : posts
	- table : users	（今は機能してない）

## Sampleの見方
[socketによる設定](./httpアクセス.md.html)をしている状態で  
Firefoxで`http://172.20.156.17/home/index`にアクセスするとPostの一覧が表示される  
DBの中身と見比べてみると、DBから情報が読み込まれてるのがわかる（ほんとか？）

## その他のリファレンス
参考になりそうなページ？
+ [ざっくりCakePHP2.×入門 - Qiita](http://qiita.com/kazukichi/items/2ef6f81e11709f1a75bd)  
固めの内容
+ [cakephpを使って10分でCMSを作る方法 | Web活メモ帳](http://blog.verygoodtown.com/2011/07/cakephp-10-minutes-cms/)  
軽いが内容はばっくり
+ [CakePHPをゼロから始めるときの参考サイト - NAVER まとめ](http://matome.naver.jp/odai/2138245018375771201)  
リンク集。読むのは後でいいとおもう
+ [CakePHPのお勉強　１回目　お問い合わせサンプル - altere5's blog](http://altere5.hateblo.jp/entry/2013/11/16/CakePHP%E3%81%AE%E3%81%8A%E5%8B%89%E5%BC%B7_%EF%BC%91%E5%9B%9E%E7%9B%AE_%E3%81%8A%E5%95%8F%E3%81%84%E5%90%88%E3%82%8F%E3%81%9B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB)    
Try&Error式で書いてあるから読みづらい。ConculusionFirstとはいったい
+ [CakePHPを使ってPHP開発を高速化する方法 | Web制作会社スタイル](http://www.hp-stylelink.com/news/2013/10/20131011.php#list04)  
コードの解説多め
