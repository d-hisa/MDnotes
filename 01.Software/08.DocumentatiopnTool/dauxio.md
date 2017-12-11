# Daux.io
## Introduction
phpベースのMarkdownドキュメンテータ。  
よしなになメニュー構成を提供してくれる。
## Prerequirements
- homebrew or chocolatey

### PHPのセットアップ
#### Win
```bash
# PHP5系との親和性が高いらしい
$ cinst php --version 5.6.30
```
#### Mac
入ってたので割愛

### composerのセットアップ
#### Win
```bash
$ cinst composer
```
#### Mac
入ってた（ｒｙ

### Install
```bash
$ composer global require justinwalsh/daux.io
```
### Usage
```bash
$ cd /work/dir/
$ mkdir doc # デフォルトではdocs以下のファイルをジェネレートする
$ duax  # ~/.composer/vendor/binにpathを通しておくこと
```
#### ファイルの名前と順序
ジェネレートされるコンテンツは、基本的に以下の仕様に準じる
- アルファベット順にソートされる
- TOCの名前はファイル名から引き継がれる
- ファイル名はスネークケースにすると、キャピタルスペースに変換される
  - ex.)`google_chrome.md`->`Google Chrome`
- 文頭の数字は省略される
  - ex.)`01_getting_start.md`->`Getting Start`
- 文頭をアンスコにすると数字が反映される
  - ex.)`_5_hoge_fuga`->`5 Hoge Fuga`

#### ドキュメントの設定
基本的には`doc/config.json`に設定値を記述する。
```ruby
{
    "title": "左上に表示されるタイトル",
    "tagline":"サブタイトル？",
    "author":"どっかに出るかもしれない著者",
    "timezone":"Asia/Tokyo",
    "html":{
        "theme":"daux-red", #色のテーマ
        "float":false,      #
        "toggle_code":false,#コードの表示形式切替
        "search":false      #サーチバー
    }
}

```