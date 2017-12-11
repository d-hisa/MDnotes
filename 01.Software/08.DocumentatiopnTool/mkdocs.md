# MkDocs
## Introduction
Python製のドキュメンテータ。  
PlantUMLが使えそうなので試す。あとおしゃれ。

## Prerequirements
- Python
- pip

## Installation
```bash
$ pip install mkdocs
$ mkdocs --version
# 便利らしい
$ pip install pigments
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
# Copyright表記
copyright: hoge
# Pluginの設定(明示的にすべてのプラグインをdisableする)
plugin: []
```