# MkDocs
## Introduction
Python製のドキュメンテータ。  
PlantUMLが使えそうなので試す。あとおしゃれ。

`../`

## Prerequirements
- Python
- pip

## Installation
```bash
$ pip install mkdocs
$ mkdocs --version
# 便利らしい
$ pip install pigments
# みんな使っってるテーマ
$ pip install mkdocs-material
```

## Usage
```bash
$ cd /path/to/workspace
$ mkdocs new testDocs
$ cd testDocs
$ cp /hoge/path/document.md ./docs
$ mkdocs build
$ mkdocs serve
```

## created docs directory
- `/path/to/workspace`
    - `docs`: markdown store directory
        - `index.md`: default start page html resource
    - `mkdocs.yml`: mkdocs configuration file
    - `site`: built static files

## configration
`mkdocs.yml`を編集する
```yml
# サイト名
site_name: "Site Name"
# htmlのみで配布する際はfalseにする。これがtrueだとserveしないと上手く動かない
use_direcory_urls: false
# テーマ設定
theme: readthedocs
theme :material	# materialを使いは場合はこれ
# Copyright表記
copyright: hoge
# Pluginの設定(明示的にすべてのプラグインをdisableする)
plugin: []
```

## customization
### cssをカスタムする
```bash
$ cd /path/to/MkdocRoot
$ touch custom.css
```
**custom.css**
```css
img{
	height: 100px;
	width: auto;
}
```
**mkdocs/yml**
```yml
extra_css:
	- "css/cutom.css"
```

## Lightboxを使う
画像をクリックすると拡大されるLightboxを使いたい
- mkドキュメントルートへ移動し、クローンする
	- `$ git clone https://github.com/MrLeeh/mkdocs-rtd-lightbox`
- `mkdocs.yml`にカスタムテーマを設定
```yml
theme:
	name: hoge
	custom_dir: mkdocs-rtd-lightbox
```
- `markdown-lightbox`アドオンをインストール
	- `$ pip install -e git+https://github.com/MrLeeh/markdown-lightbox.git#egg=markdown-lightbox`
- `mkdocs.yml`にプラグインを追記
```yml
markdown_extensions:
 - lightbox
 - extra
 ````
