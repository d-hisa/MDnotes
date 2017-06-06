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
$ npm install -g gitbook
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


## How to use
## Tips
## References
- gitbookのプラグインもろもろ
	* [Gitbookインストール - Qiita](http://qiita.com/tukiyo3/items/fd6b3a3c501cfd9e872f)