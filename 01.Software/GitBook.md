# GitBook
## Introduction
node.jsベースのmarkdownをいろいろよしなにしてくれるらしいヤツ。
## Installation
### Prerequrements
- node.js
	+ 導入・設定などは[node.js note](../07.DevelopmentLanguage/nodejs.md)を参照のこと。
- npm
	+ node.jsを入れるとだいたいついてくる

### Install
そこそこ時間かかるので注意。
```bash
$ npm install -g gitbook-cli
$ gitbook --version
# ↑これを打つと、gitbook本体のインストールが始まる
```
#### PROXY配下の場合
プロキシを通す場合、npmに色々設定が必要。  
色々試しすぎてどれが功を奏したのかわからないので色々貼っておく
```bash
# gitでhttpsをgit扱いにする設定
$ git config --global url."https://".insteadOf git://
$ git config -l #確認コマンド
# npmのプロキシ設定
$ npm config set proxy PROXY_ADD:PORT
$ npm config set https-proxy PROXY_ADD:PORT
$ npm config set registry http://registry.npmjs.org/
$ npm config list
~
; globalconfig
# ここにだいたい入るけど、一応ユーザも設定する
~
$ vim ~/.npmrc
[.npmrc]
registry="http://registry.npmjs.org/"
proxy="PROXY_ADD:PORT"
https-proxy="PROXY_ADD:PORT"
https-proxy="PROXY_ADD:PORT"
strict-ssl=false
[end]
$ npm config list
~
; userconfig
~
# ここにも入っていれば多分OK
```

## Settings
### PlugIns
```bash
# How to install
$ npm install -g PLUGIN_NAME
# settings(if needed)
$ touch ./ROOT_GITBOOK_DIR/book.json
$ vim book.json
[book.json]
{
	"plugins": ["PLUGIN_NAME1","PLUGIN_NAME2", ...]
}
-- end of file
```
#### gitbook-summary
- Desc.
	+ `SUMMARY.md`をディレクトリ構成から自動生成する（.mdのみ）
- Usage
	+ 単純にディレクトリ構成からSUMMARYを生成（ルートディレクトリで実行?）
		* `$ book sm`
- Ref.
	+ [imfly/gitbook-summary: A command line tool to generate a summary.md for Gitbook](https://github.com/imfly/gitbook-summary)

#### gitbook-plugin-sharing
- Desc.
	+ twitter/facebookなどのシェアボタンを消す
- Usage
	+ Add `"-sharing"` to `"plugins"` on `book.json`

### GitBookシェアリンクを消す
```bash
$ mkdir GITBOOK_ROOT/styles
$ touch GITBOOK_ROOT/styles/website.css
$ vim GITBOOK_ROOT/styles/website.css
```
[website.css]
```css
.gitbook-link {
    display: none !important;
}
```
```bash
$ touch GITBOOK/book.json
$ vim GITBOOK/book.json
```
[book.json]
```json
{
    "styles": {
        "website": "styles/website.css"
    }
}
```
### PDFなどに吐く
#### Windows編
- [calibre - E-book management](http://calibre-ebook.com/)を入れる。必須なのかはよくわからない。
- `npm install -g ebook-convert`
- `gitbook pdf`とか`gitbook epub`とかで吐き出せる
	* windowsの場合、cmdを管理者権限で起こしてから叩かないとなんかダメ。

#### Mac編
- `brew cask install calibre`

## How to use
## Tips
## References
- gitbookのプラグインもろもろ
	* [Gitbookインストール - Qiita](http://qiita.com/tukiyo3/items/fd6b3a3c501cfd9e872f)
